class Freesound::Request
  attr_reader :uri, :params, :response, :format, :response_parser

  def initialize(params={})
    @params = params.dup
    @format = params.delete(:format) || :json
    @response_parser = ResponseParser.new(@format)

    uri_compiler = URICompiler.new(params)
    @uri         = uri_compiler.uri
    @response    = nil
  end

  def get!
    @response = @response_parser.parse(Net::HTTP.get(@uri))
  end
end
