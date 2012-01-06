class Freesound::ResponseParser

  class InvalidResponseFormatError < ArgumentError; end

  attr_reader :format

  def initialize(format=:json)
    self.format = format
  end

  def format=(format)
    raise(InvalidResponseFormatError, "#{format} is not a valid response format") unless [:json, :xml, :yaml, :yml].include?(format.to_sym)
    @format = format.to_sym
  end

  def parse(raw)
    case @format
    when :xml
      parse_xml(raw)
    when :yaml, :yml
      parse_yaml(raw)
    else
      parse_json(raw)
    end
  end

  private

  def parse_json(raw)
    ::Crack::JSON.parse(raw).underscore_keys.symbolize_keys
  end

  # xml gets parsed slightly differently than json and yaml.
  # the result needs to convert single element arrays to strings,
  # convert strings like "2" to their corresponding number object i.e. 2
  # and remove the nesting of the :tags key under "resource"
  def parse_xml(raw)
    result = ::Crack::XML.parse(raw)["response"].underscore_keys
      .symbolize_keys
      .flatten_single_element_array_values
      .numberize_values
    result[:tags] = result[:tags]["resource"]
    result
  end

  def parse_yaml(raw)
    ::YAML::load(raw).underscore_keys.symbolize_keys
  end
end
