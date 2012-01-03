require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ResponseParser do
  subject { ResponseParser.new }

  before do
    @json = <<-END
      {
        "format":"json"
      }
    END

    @xml  = <<-END
      <response>
        <format>xml</format>
      </response>
    END

    @yaml = <<-END
      format: yaml
    END
  end

  describe '#parse' do
    it 'parses JSON by default' do
      subject.parse(@json)[:format].should == 'json'
    end

    it 'parses xml' do
      ResponseParser.new(:xml).parse(@xml)[:format].should == 'xml'
    end

    it 'parses yaml' do
      ResponseParser.new(:yaml).parse(@yaml)[:format].should == 'yaml'
    end
  end
end
