class Freesound::URICompiler
  attr_reader :uri

  def initialize(params)
    search_params = params.delete(:search)
    sound_id      = params.delete(:sound_id)
    format        = params.delete(:format)
    @uri          = URI.parse(compile_uri_string(search_params, sound_id, format))
  end

  def compile_uri_string(search_params, sound_id, format)
    if search_params
      search_uri(search_params).sign_with_api_key(Configuration.api_key)
    elsif sound_id
      sound_id_uri(sound_id).sign_with_api_key(Configuration.api_key)
    else
      blank_uri
    end + (format.nil? ? "" : "&format=#{format}")
  end

  private

  def blank_uri
    "#{Configuration.sounds_url}"
  end

  def search_uri(search_params)
    "#{Configuration.sounds_url}/search?#{search_params.to_uri}"
  end

  def sound_id_uri(id)
    "#{Configuration.sounds_url}/#{id}?"
  end
end
