require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Freesound do
  describe Configuration do
    it 'has default configuration parameters' do
      Freesound::Configuration.sounds_url.should == "http://www.freesound.org/api/sounds"
    end

    it 'adds configuration parameters' do
      Freesound::Configuration.api_key = '123abc'
      Freesound::Configuration.api_key.should == '123abc'
    end
  end
end
