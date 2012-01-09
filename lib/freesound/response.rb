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
      self.data[:num_results] || 1
    end

    def sounds
      @sounds ||= if num_results == 1
                    [ Sound.new(*self.data.values) ]
                  else
                    self.data[:sounds].map { |data| Sound.new(data) }
                  end
    end
  end
end
