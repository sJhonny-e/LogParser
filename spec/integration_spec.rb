require 'spec_helper'

RSpec.describe 'Stats for a test log file' do
    subject(:stats_for_file) { `ruby log_parser.rb spec/test_log.log` }

    it 'contains an ordered list of pages by total visits' do
        total_visits_stats = <<-STATS
/page_1 4 vists
/page_2 3 visits
        STATS
        expect(stats_for_file).to include total_visits_stats
    end
    
    it 'contains an ordered list of pages by unique views' do
        unique_views_stats = <<-STATS
/page_2 2 uinque views
/page_1 1 unique views
        STATS
        expect(stats_for_file).to include unique_views_stats
    end
end