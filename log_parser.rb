#!/usr/bin/env ruby
require './app/log_parser'

def create_log_lines_store(log_file_name)
    file_content = File.read(log_file_name)
    parser = FileParser.new(file_content)

    store = LogLineStore.new
    parser.log_lines.each { |l| store.store_log_line(l) }
    store
end

def print_stats(visitor, description)
    visitor.stats.sort_by(&:last).reverse.each do |url, num|
        puts "#{url} #{num} #{description}"
    end
end

log_file_name = ARGV[0]
unless log_file_name
    puts "Usage: ./log_parser.rb <log file name>" 
    abort
end
puts "analyzing log file: #{log_file_name}"

store = create_log_lines_store(log_file_name)

totals_visitor = TotalPageVisitsVisitor.new
uniques_visitor = UniqueViewsVisitor.new
store.visit_all([totals_visitor, uniques_visitor])

print_stats(totals_visitor, 'visits')
print_stats(uniques_visitor, 'unique views')