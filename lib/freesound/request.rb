module Freesound
  class InvalidRequestFormatError < ArgumentError; end

  class Request
    attr_reader :uri, :params, :response, :format

    def initialize(params={})
      self.format = params[:format] || :json
      @params = params
      @response = nil
    end

    def format=(format)
      raise(InvalidRequestFormatError, "#{format} is not a valid request format") unless [:json, :xml, :yaml, :yml].include?(format.to_sym)
      @format = format.to_sym
    end

    def uri
      @uri ||= URICompiler.new(@params.dup.merge({:format => @format})).uri
    end

    def get!
      response_body = Net::HTTP.get_response(self.uri).body
      @response ||= Response.new(response_body, @format)
    end
  end
end
