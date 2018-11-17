require 'spec_helper'

RSpec.describe UniqueViewsVisitor do
    it 'counts total views of a given URL by unique IP addresses' do
        line_for_url1 = LogLine.new('url1', 'some IP')
        line_for_url2 = LogLine.new('url2', 'some IP')
        line_for_url1_different_ip = LogLine.new('url1', 'some other IP')
        line_for_url2_same_ip = LogLine.new('url2', 'some IP')

        visitor = described_class.new
        [line_for_url1, line_for_url2, line_for_url1_different_ip, line_for_url2_same_ip]
            .each {|l| visitor.visit(l)}
        
        expect(visitor.stats).to eq('url1' => 2, 'url2' => 1)
    end
end