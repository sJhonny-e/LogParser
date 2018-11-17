require 'spec_helper'

RSpec.describe LogLine do
    class TestVisitor
        attr_reader :pages
        def initialize
            @pages = []
        end

        def visit(log_line)
            @pages << log_line.page_url
        end
    end

    it 'accepts visitors' do
        visitor = TestVisitor.new
        line = described_class.new('some_url', 'some IP')
        line.accept(visitor)

        expect(visitor.pages).to eq(['some_url'])
    end
end