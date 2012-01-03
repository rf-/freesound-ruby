require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Response do
  it 'fails with invalid format' do
    expect { Response.new("{}", :format => :gif) }.to raise_error(InvalidResponseFormatError)
  end
end
