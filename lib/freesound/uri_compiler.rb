class Freesound::URICompiler
  attr_reader :uri

  def initialize(params)
    search_params = params.delete(:search)
    sound_id      = params.delete(:sound_id)
    @uri          = compile_uri(search_params, sound_id)
  end

  def compile_uri(search_params, sound_id)
    if search_params
      URI.parse(search_uri(search_params).sign_with_api_key(Configuration.api_key))
    elsif sound_id
      URI.parse(sound_id_uri(sound_id).sign_with_api_key(Configuration.api_key))
    end
  end

  private

  def search_uri(search_params)
    "#{Configuration.sounds_url}/search?#{search_params.to_uri}"
  end

  def sound_id_uri(id)
    "#{Configuration.sounds_url}/#{id}?"
  end
end
