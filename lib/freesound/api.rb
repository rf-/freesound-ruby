module Freesound
  class InvalidRequest < ArgumentError; end

  module API
    BASE_URL   = "http://www.freesound.org/api"
    SOUNDS_URL = "#{BASE_URL}/sounds" 

    def self.fetch(request)
      raise(InvalidRequest, "#{request.inspect} is not a #{Request.inspect}") unless request.is_a?(Request)

    end
  end
end
