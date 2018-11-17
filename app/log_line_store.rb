class LogLineStore
    def initialize
        @lines = []
    end

    def store_log_line(log_line)
        lines << log_line
    end

    def visit_all(visitors)
        lines.each do |l|
            visitors.each { |visitor| l.accept(visitor) }
        end
    end

    private
    attr_reader :lines
end