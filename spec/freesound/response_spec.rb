require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Response do
  it 'takes a raw hash' do
    Response.new('{"id": 3}', :json).data.should == {:id => 3}
  end
end
