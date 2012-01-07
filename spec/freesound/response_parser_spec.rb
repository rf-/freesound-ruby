require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ResponseParser do
  it 'initializes with a format' do
    ResponseParser.new(:xml).format.should == :xml
  end

  describe '#parse' do
    before do
      @json = File.read("#{Freesound.root_dir}/data/sample.json")
      @xml  = File.read("#{Freesound.root_dir}/data/sample.xml")
      @yaml = File.read("#{Freesound.root_dir}/data/sample.yaml")

      @json_parser = ResponseParser.new(:json)
      @xml_parser  = ResponseParser.new(:xml)
      @yaml_parser = ResponseParser.new(:yaml)

      @json_result = @json_parser.parse(@json)
      @xml_result  = @xml_parser.parse(@xml)
      @yaml_result = @yaml_parser.parse(@yaml)

      # these are the expected tags if the above files are parsed correctly
      @tags = [ "transformation", "speech", "voice", "plane", "morph" ]
    end

    it 'parses json' do
      @json_result[:id].should == 10
      @json_result[:tags].should == @tags
    end

    it 'parses xml' do
      @xml_result[:id].should == 10
      @xml_result[:tags].should == @tags
    end

    it 'parses yaml' do
      @yaml_result[:id].should == 10
      @yaml_result[:tags].should == @tags
    end

    it 'parses equal data into equal hashes' do
      @yaml_result.each_key do |key|
        @json_result[key].should == @yaml_result[key]
        @xml_result[key].should == @yaml_result[key]
      end
    end
  end
end
