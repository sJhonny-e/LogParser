require 'spec_helper'

RSpec.describe LogLine do

    it 'accepts visitors' do
        visitor = TestVisitor.new
        line = described_class.new('some_url', 'some IP')
        line.accept(visitor)

        expect(visitor.pages).to eq(['some_url'])
    end
end