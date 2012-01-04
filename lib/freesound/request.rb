class Freesound::Request
  attr_reader :uri, :params

  def initialize(params={})
    @params = params
    uri_compiler = URICompiler.new(params.dup)
    @uri         = uri_compiler.uri
  end
end
