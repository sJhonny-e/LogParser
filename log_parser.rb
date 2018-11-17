#!/usr/bin/env ruby
require './app/log_parser'

log_file_name = ARGV[0]
unless log_file_name
    puts "Usage: ./log_parser.rb <log file name>" 
    abort
end
puts "analyzing log file: #{log_file_name}"

file_content = File.read(log_file_name)
parser = FileParser.new(file_content)

store = LogLineStore.new
parser.log_lines.each { |l| store.store_log_line(l) }

totals_visitor = TotalPageVisitsVisitor.new
uniques_visitor = UniqueViewsVisitor.new
store.visit_all([totals_visitor, uniques_visitor])

totals_visitor.stats.sort_by(&:last).reverse.each do |url, num|
    puts "#{url} #{num} visits"
end