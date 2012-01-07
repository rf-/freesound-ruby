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

  def [](key)
    self.data[key]
  end
end
