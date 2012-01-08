module Freesound
  class InvalidApiKeyError < ArgumentError; end

  class Client
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
      response.sounds.first
    end

    def search_sounds(query, options={})
      request = Request.new(:search => {:q => query})
      response = request.get!
      response.sounds
    end
  end
end
