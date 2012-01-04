require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Request do
  subject { Request.new({:sound_id => 13}) }

  it 'initializes with a params hash' do
    subject.params.should == {:sound_id => 13}
  end

  describe '#send!' do
    it 'returns a hash' do
      subject.send!.should be_a(Hash)
    end

    context 'after #send!' do
      before { subject.send! }
    
      it 'has a response corresponding to the params of the request' do
        subject.response[:sound_id].should == 13
      end
    end
  end
end
