module Freesound
  class Response
    def initialize(raw="", options={})
      @format = options[:format] || :json
      @parser = ResponseParser.new(@format)
      @data = @parser.parse(raw)
    end
  end
end
