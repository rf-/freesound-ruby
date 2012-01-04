module Freesound
  class Request
    attr_reader :uri, :params

    def initialize(search=nil, sound_id=nil, params={})
      @uri_parser = URICompiler.new(search, sound_id, params)
    end

    class URICompiler
      attr_reader :uri

      def initialize(search, sound_id, params)
        @search   = search
        @sound_id = sound_id
        @params   = params
      end

      def compile_uri(search, sound_id, params)
        "#{Configuration.sounds_url}?#{params.to_uri}&api_key=#{Configuration.api_key}"
      end
    end
  end
end
