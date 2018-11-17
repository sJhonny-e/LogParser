class UniqueViewsVisitor

    def initialize
        @urls_to_page_visitors = {}
    end

    def visit(log_line)
        urls_to_page_visitors[log_line.page_url] ||= Set.new
        urls_to_page_visitors[log_line.page_url] << log_line.visitor_ip
    end

    def stats
        urls_to_page_visitors.map do |url, set|
            [url, set.size]
        end.to_h
    end

    private
    attr_reader :urls_to_page_visitors
end