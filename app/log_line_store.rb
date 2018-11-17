class LogLineStore
    def initialize
        @lines = []
    end

    def store_log_line(log_line)
        lines << log_line
    end

    def visit_all(visitor)
        lines.each { |l| l.accept(visitor) }
    end

    private
    attr_reader :lines
end