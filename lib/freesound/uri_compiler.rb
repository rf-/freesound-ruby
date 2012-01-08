class Freesound::URICompiler
  attr_reader :uri

  def initialize(params)
    search_params = params.delete(:search)
    sound_id      = params.delete(:sound_id)
    format        = params.delete(:format)
    @uri          = URI.parse(compile_uri_string(search_params, sound_id, format))
  end

  def compile_uri_string(search_params, sound_id, format)
    format_string = format ? "&format=#{format}" : ""

    if search_params
      search_uri(search_params, format_string)
    elsif sound_id
      sound_id_uri(sound_id, format_string)
    end
  end

  private

  def search_uri(search_params, format_string)
    "#{Freesound.config.sounds_url}/search/?api_key=#{Freesound.config.api_key}#{format_string}&#{search_params.to_uri}"
  end

  def sound_id_uri(id, format_string)
    "#{Freesound.config.sounds_url}/#{id}/?api_key=#{Freesound.config.api_key}#{format_string}"
  end
end
