require 'spec_helper'

RSpec.describe TotalPageVisitsVisitor do
    it 'counts total visits for a given URL' do
        line_for_url1 = LogLine.new('url1', 'some IP')
        line_for_url2 = LogLine.new('url2', 'some IP')
        another_line_for_url1 = LogLine.new('url1', 'some IP')
        
        visitor = described_class.new
        [line_for_url1, line_for_url2, another_line_for_url1].each {|l| visitor.visit(l)}

        expect(visitor.stats).to eq('url1' => 2, 'url2' => 1)
    end
end