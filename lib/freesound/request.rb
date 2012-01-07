class Freesound::InvalidRequestFormatError < ArgumentError; end

class Freesound::Request
  attr_reader :uri, :params, :response, :format

  def initialize(params={})
    @format = params[:format] || :json
    raise(InvalidRequestFormatError, "#{format} is not a valid request format") unless [:json, :xml, :yaml, :yml].include?(@format.to_sym)

    @params = params
    @response = nil
  end

  def format=(format)
    @format = format.to_sym
  end

  def uri
    @uri ||= URICompiler.new(@params.dup.merge({:format => @format})).uri
  end

  def get!
    response_body = Net::HTTP.get_response(uri).body
    @response ||= Response.new(response_body, @format)
  end
end
