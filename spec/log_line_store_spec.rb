require 'spec_helper'

RSpec.describe LogLineStore do
   let(:store) { described_class.new }

   before do
    line1 = LogLine.new('url1', 'some ip')
    line2 = LogLine.new('url2', 'some ip')
    line3 = LogLine.new('url3', 'some ip')

    [line1, line2, line3].each { |l| store.store_log_line(l) }
   end

    it 'allows storage and subsequent visiting of given log lines' do
        visitor = TestVisitor.new
        store.visit_all([visitor])

        expect(visitor.pages).to eq(['url1', 'url2', 'url3'])
    end

    it 'allows multiple visitors' do
        visitor1 = TestVisitor.new
        visitor2 = TestVisitor.new
        
        store.visit_all([visitor1, visitor2])

        expect(visitor1.pages).to eq(['url1', 'url2', 'url3'])
        expect(visitor2.pages).to eq(['url1', 'url2', 'url3'])
    end
end