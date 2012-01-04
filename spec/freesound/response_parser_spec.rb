require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ResponseParser do
  subject { ResponseParser.new(:json) }

  it 'initializes with a format' do
    subject.format.should == :json
  end

  it 'fails with invalid format' do
    expect { ResponseParser.new(:pdf) }.to raise_error(ResponseParser::InvalidResponseFormatError)
  end

  describe '#parse' do
    before do
      @json = File.read("#{Freesound.root_dir}/data/sample.json")
      @xml  = File.read("#{Freesound.root_dir}/data/sample.xml")
      @yaml = File.read("#{Freesound.root_dir}/data/sample.yaml")
    end

    it 'parses json' do
      subject.parse(@json).id.should == 10
    end

    it 'parses xml' do
      ResponseParser.new(:xml).parse(@xml).id.should == 10
    end

    it 'parses yaml' do
      ResponseParser.new(:yaml).parse(@yaml).id.should == 10
    end
  end
end
