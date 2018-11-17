require 'spec_helper'

RSpec.describe FileParser do
    it 'parses the given lines, delimited by whitespace, into LogLine objects' do
        # note a tab whitespace in the 1st line
        lines = <<-LINES
/some/url    1.2.3 
/some/other_url 1.2.4
/some/url 1.2.3
LINES
        parser = described_class.new(lines)
        expect(parser.log_lines).to include(
            an_object_having_attributes(page_url: '/some/url', visitor_ip: '1.2.3'),
            an_object_having_attributes(page_url: '/some/other_url', visitor_ip: '1.2.4'),
            an_object_having_attributes(page_url: '/some/url', visitor_ip: '1.2.3'),
        )
    end
end