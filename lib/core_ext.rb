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

  def numberize_values
    Hash[ map { |k, v| [k, ( (v.numberizeable? rescue false) ? v.numberize : v )] } ]
  end

  def underscore_keys
    Hash[ map { |k, v| [(k.underscore rescue k), v] } ]
  end
end

class String
  def sign_with_api_key(key)
    "#{self}&api_key=#{key}"
  end

  def numberize
    if numberizeable?
      float? ? to_f : to_i
    end
  end

  def numberizeable?
    !scan(/^\-?\d*\.?\d*$/).empty?
  end

  def underscore
    gsub(/\W/, '_')
  end

  private

  def float?
    scan(/\./).size == 1
  end
end
