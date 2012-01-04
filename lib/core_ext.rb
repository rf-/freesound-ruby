class Hash
  def symbolize_keys
    Hash[ map { |k, v| [k.to_sym, v] } ]
  end

  # converting xml into a hash sometimes gives you things like:
  # { 'element' => ['just_one_value'] }
  # this method converts this to the more useful
  # { 'element' => 'just_one_value' }
  def flatten_single_element_array_values
    Hash[ map do |k, v|
      [k, (v.is_a?(Array) && v.size == 1) ? v[0] : v]
    end ]
  end

  # convert to a uri string
  def to_uri
    map { |k, v| "#{k}=#{v}" }.join("&")
  end
end

class String
  def sign_with_api_key(key)
    "#{self}&api_key=#{key}"
  end
end
