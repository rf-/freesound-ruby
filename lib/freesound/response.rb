module Freesound
  class Response
    attr_reader :content, :parser

    def initialize(raw, format=:json)
      @content = raw
      @format  = format
      @parser  = ResponseParser.new(format)
    end

    def data
      @data ||= @parser.parse(@content)
    end

    def num_results
      self.data.is_a?(Array) ? self.data.size : 1
    end

    def sounds
      @sounds ||= if num_results == 1
                    [ Sound.new(*self.data.values) ]
                  else
                    self.data.map do |sound|
                      result = Sound.new
                      sound.each { |k, v| result.send("#{k}=", v) }
                      result
                    end
                  end
    end
  end
end
