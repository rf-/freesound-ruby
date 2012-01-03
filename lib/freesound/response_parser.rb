require 'json/ext'
require 'xmlsimple'

module Freesound
  class InvalidResponseFormatError < ArgumentError; end

  class ResponseParser
    FORMATS = [ :json, :xml, :yaml ]

    def initialize(format=:json)
      @format = format
      raise(InvalidResponseFormatError, "Not a valid format.") unless FORMATS.include?(@format)
    end

    def parse(raw)
      case @format
      when :xml
        parse_xml(raw)
      when :yaml
        parse_yaml(raw)
      else
        parse_json(raw)
      end
    end

    private

    def parse_xml(raw)
      XmlSimple.xml_in(raw).symbolize_keys
    end

    def parse_yaml(raw)
      YAML::load(raw).symbolize_keys
    end

    def parse_json(raw)
      JSON.parse(raw).symbolize_keys
    end
  end
end
