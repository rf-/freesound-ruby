class Freesound::Response
  attr_reader :content, :parser

  def initialize(raw, format=:json)
    @content = raw
    @format  = format
    @parser  = Freesound::ResponseParser.new(format)
  end

  def data
    @data ||= @parser.parse(@content)
  end

  def num_results
    self.data[:num_results] || 1
  end

  def sounds
    @sounds ||= if num_results == 1
                  [ Freesound::Sound.new(*self.data.values) ]
                else
                  self.data[:sounds].map { |data| Freesound::Sound.new(data) }
                end
  end

  def [](key)
    self.data[key]
  end
end
