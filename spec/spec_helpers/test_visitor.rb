class TestVisitor
    attr_reader :pages
    def initialize
        @pages = []
    end

    def visit(log_line)
        @pages << log_line.page_url
    end
end