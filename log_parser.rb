#!/usr/bin/env ruby
require './app/log_line'
require './app/log_line_store'
require './app/visitors/total_page_visits_visitor'

puts "analyzing log file: #{ARGV[0]}"