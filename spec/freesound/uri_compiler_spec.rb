require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe URICompiler do 
  describe '#compile_uri' do
    it 'compiles a proper sound-by-id uri' do
      URICompiler.new({:sound_id => 12}).uri.should == "http://www.freesound.org/api/sounds/12?&api_key=#{Configuration.api_key}"
    end

    it 'compiles a proper search uri' do
      URICompiler.new({:search => {:q => 'bass', :p => 2}}).uri.should ==
        "http://www.freesound.org/api/sounds/search?q=bass&p=2&api_key=#{Configuration.api_key}"
    end
  end
end

