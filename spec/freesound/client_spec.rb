require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Client do
  it 'has an api key' do
    Client.new('123abc').api_key.should == '123abc'
  end

  context 'with valid api key' do
    subject { Client.new(Configuration.api_key) }

    before do
      json = File.read("#{Freesound.root_dir}/data/sample.json")
      path = "http://www.freesound.org/api/sounds/10/?api_key=#{Configuration.api_key}&format=json"

      stub_request(:get, path).to_return(:body => json)
    end

    describe '#get_sound' do
      it 'returns a Response' do
        subject.get_sound(10).should be_a(Response)
      end

      it 'returns a Response corresponding to the given id' do
        subject.get_sound(10)[:id].should == 10
      end

      it 'adds to @requests and @responses' do
        subject.get_sound(10)
        subject.requests.first.should be_a(Request)
        subject.responses.first.should be_a(Response)
      end
    end

    describe '#search_sounds' do
      pending "not implemented yet"
    end
  end
end
