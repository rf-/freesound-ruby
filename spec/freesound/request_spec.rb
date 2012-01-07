require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Request do
  subject { Request.new({:sound_id => 10}) }

  it 'initializes with a params hash' do
    subject.params.should == {:sound_id => 10}
  end

  it 'fails with invalid format' do
    expect { Request.new({:format => :pdf}) }.to raise_error(InvalidRequestFormatError)
  end

  describe '#get!' do
    before do
      json = File.read("#{Freesound.root_dir}/data/sample.json")
      path = "http://www.freesound.org/api/sounds/10?api_key=#{Configuration.api_key}&format=json"

      #stub_request(:get, path).to_return(:body => json)
    end

    it 'returns a Response' do
      subject.get!.should be_a(Response)
    end

    context 'after #get!' do
      before { subject.get! }
    
      it 'has a response corresponding to the params of the request' do
        subject.response[:id].should == 10
      end
    end
  end
end
