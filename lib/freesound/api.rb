module Freesound
  class InvalidRequest < ArgumentError; end

  module API
    def self.get(request)
      raise(InvalidRequest, "#{request.inspect} is not a #{Request.inspect}") unless request.is_a?(Request)

    end
  end
end
