require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Request do
  before  { @params = {:sound_id => 23} }
  subject { Request.new(@params) }

  it 'initializes with a params hash' do
    subject.params.should == @params
  end

  it 'compiles a proper uri' do
    subject.uri.should == "http://www.freesound.org/api/sounds?sound_id=23&api_key=#{Configuration.api_key}"
  end

  describe '#send!' do
    it 'returns a hash' do
      subject.send!.should be_a(Hash)
    end
  end
end
