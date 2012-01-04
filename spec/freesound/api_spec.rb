require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe API do
  describe '.get' do
    it 'takes a request object' do
      expect { subject.get(Request.new) }.to_not raise_error
      expect { subject.get("not really a request") }.to raise_error(InvalidRequest)
    end
  end
end
