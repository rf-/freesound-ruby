class Freesound::Response
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
                  [ Sound.new(@data) ]
                else
                  @data[:sounds].map { |data| Sound.new(data) }
                end
  end

  def [](key)
    self.data[key]
  end
end
