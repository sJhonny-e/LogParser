class FileParser
    def initialize(str)
        @raw_string = str
    end

    def log_lines
        raw_lines = raw_string.split(/\r?\n/)
        raw_lines.map do |raw_line|
            split_line = raw_line.split # by default splits by whitespace
            LogLine.new(split_line[0], split_line[1])
        end
    end

    private
    attr_reader :raw_string
end