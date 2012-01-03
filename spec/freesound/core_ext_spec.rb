require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Hash do
  describe '#symbolize_keys' do
    it 'symbolizes keys' do
      {"one" => 1, "two" => 2}.symbolize_keys.should == {:one => 1, :two => 2}
    end
  end
end
