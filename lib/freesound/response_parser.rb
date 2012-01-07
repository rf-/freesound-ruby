class Freesound::ResponseParser
  attr_reader :format

  def initialize(format)
    @format = format
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
