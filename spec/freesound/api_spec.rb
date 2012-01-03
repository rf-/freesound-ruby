require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe API do
  describe '.fetch' do
    it 'takes a request object and api key' do
      expect { subject.fetch(Request.new(@api_key)) }.to_not raise_error
      expect { subject.fetch("not really a request") }.to raise_error(InvalidRequest)
    end
  end
end
