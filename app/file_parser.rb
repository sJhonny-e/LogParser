class FileParser
    def initialize(str)
        @raw_string = str
    end

    def log_lines
        @log_lines ||= parse_raw_string
    end

    private
    attr_reader :raw_string

    def parse_raw_string
        raw_lines = raw_string.split(/\r?\n/)
        raw_lines.map do |raw_line|
            split_line = raw_line.split # by default splits by whitespace
            LogLine.new(split_line[0], split_line[1])
        end
    end
end