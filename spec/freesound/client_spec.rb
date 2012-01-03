require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include Freesound

describe Client do
  subject { Client.new(:api_key => ENV['FREESOUND_KEY']) }

  it 'takes a block for initialization' do
    Client.new { |config| config.api_key = "123abc" }.api_key.should == "123abc"
  end

  describe '#sound' do
    it 'returns a response object' do
      subject.sound(23).should be_a(Response)
    end
  end
end
