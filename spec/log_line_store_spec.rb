require 'spec_helper'

RSpec.describe LogLineStore do
   
    it 'allows storage and subsequent visiting of given log lines' do
        line1 = LogLine.new('url1', 'some ip')
        line2 = LogLine.new('url2', 'some ip')
        line3 = LogLine.new('url3', 'some ip')

        store = described_class.new
        [line1, line2, line3].each { |l| store.store_log_line(l) }
        
        visitor = TestVisitor.new
        store.visit_all(visitor)

        expect(visitor.pages).to eq(['url1', 'url2', 'url3'])
    end
end