require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Hash do
  describe '#symbolize_keys' do
    it 'symbolizes keys' do
      {"one" => 1, "two" => 2}.symbolize_keys.should == {:one => 1, :two => 2}
    end
  end

  describe '#flatten_single_element_array_values' do
    it 'converts values that are single element arrays into just the first element of that array' do
      {"one" => [1], "two_and_three" => [2, 3], "four" => 4}
      .flatten_single_element_array_values.should == {"one" => 1, "two_and_three" => [2, 3], "four" => 4}
    end
  end

  describe '#to_uri' do
    it 'converts hash to a uri string' do
      {"one" => 1, :api_key => "1234"}.to_uri.should == "one=1&api_key=1234"
    end
  end
end

describe String do
  describe '#sign_with_api_key' do
    "www.test.com/api".sign_with_api_key("123api").should == "www.test.com/api&api_key=123api"
  end
end
