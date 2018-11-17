class TotalPageVisitsVisitor
    def initialize
        @urls_to_visits = {}
    end

    def visit(log_line)
        urls_to_visits[log_line.page_url] ||= 0
        urls_to_visits[log_line.page_url]+= 1
    end

    def stats
        urls_to_visits.freeze
    end

    private
    attr_reader :urls_to_visits
end