require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Client do
  subject { Client.new(:api_key => ENV['FREESOUND_KEY']) }

  it 'takes a block for initialization' do
    Client.new { |config| config.api_key = "123abc" }.api_key.should == "123abc"
  end

  describe '#send_request' do

  end
end
