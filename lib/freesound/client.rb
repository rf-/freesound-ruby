class InvalidApiKeyError < ArgumentError; end

class Freesound::Client
  attr_reader :api_key, :requests, :responses

  def initialize(api_key, options={})
    @api_key   = api_key
    @requests  = []
    @responses = []
  end

  def get_sound(id)
    request = Request.new(:sound_id => id)
    response = request.get!
    @requests << request
    @responses << response
    response
  end

  def search_sounds(query, options={})
    request = Request.new(:search => {:q => query})
    request.get!
  end
end
