require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Request do
  subject { Request.new(@api_key) }

  it 'initializes with a params hash' do
    params = {:sound_id => 23}
    Request.new(@api_key, params).params.should == params
  end

  describe '#send!' do
    it 'returns a Response object' do
      subject.send!.should be_a(Response)
    end
  end
end
