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

  describe '#numberize_values' do
    it 'turns all numerical string values to ints or floats' do
      {:one => "1", :one_point_two => "1.2", :negative_three => "-3", :something => "anything"}.numberize_values.should ==
        {:one => 1, :one_point_two => 1.2, :negative_three => -3, :something => "anything"}
    end
  end

  describe '#underscore_keys' do
    it 'underscores keys' do
      {"one-two" => 12}.underscore_keys.should == {"one_two" => 12}
    end
  end
end

describe String do
  describe '#sign_with_api_key' do
    it 'adds the api key parameter' do
      "www.test.com/api".sign_with_api_key("123api").should == "www.test.com/api&api_key=123api"
    end
  end

  describe '#numberize' do
    it 'converts to an integer' do
      '123'.numberize.should == 123
    end

    it 'converts to a float' do
      '123.456'.numberize.should == 123.456
    end

    it 'returns nil for non-numerical strings' do
      'abc123'.numberize.should be_nil
    end
  end

  describe '#numberizeable?' do
    it 'returns true' do
      %w{ 123 -2 1.23 -1.56 .900 23. 023 }.each { |str| str.should be_numberizeable }
    end

    it 'returns false' do
      %w{ 1.2.3 12a3 alex 1-23 --345 ..45 98..}.each { |str| str.should_not be_numberizeable }
    end
  end

  describe '#underscore' do
    it 'underscores -s' do
      'one-two'.underscore.should == 'one_two'
    end

    it 'underscores whitespace' do
      'one two'.underscore.should == 'one_two'
    end
  end
end
