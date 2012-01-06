require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Request do
  subject { Request.new({:sound_id => 13}) }

  it 'initializes with a params hash' do
    subject.params.should == {:sound_id => 13}
  end

  describe '#get!' do
    before do
      json = File.read("#{Freesound.root_dir}/data/sample.json")
      path = "http://www.freesound.org/api/sounds/13?api_key=#{Configuration.api_key}"

      stub_http_request(:get, path).to_return(:body => json)
    end

    it 'returns a hash' do
      subject.get!.should be_a(Hash)
    end

    context 'after #get!' do
      before { subject.get! }
    
      it 'has a response corresponding to the params of the request' do
        subject.response[:id].should == 10
      end
    end
  end
end
