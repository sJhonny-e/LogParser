class LogLine
    attr_reader :page_url, :visitor_ip
    def initialize(page_url, visitor_ip)
        @page_url = page_url
        @visitor_ip = visitor_ip
    end

    def accept(visitor)
        visitor.visit(self)
    end
end