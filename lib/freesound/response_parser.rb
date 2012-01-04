class Freesound::ResponseParser

  class InvalidResponseFormatError < ArgumentError; end

  attr_reader :format

  def initialize(format=:json)
    @format = format.to_sym
    raise(InvalidResponseFormatError, "#{format} is not a valid response format") unless [:json, :xml, :yaml, :yml].include?(@format)
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
end
