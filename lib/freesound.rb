require 'net/http'
require 'uri'
require 'json'
require 'crack'

YAML::ENGINE.yamler = 'syck'

module Freesound
  def self.root_dir
    File.expand_path('..', File.dirname(__FILE__))
  end

  class InvalidConfigurationParameterError < ArgumentError; end

  module Configuration
    DEFAULTS = {
      :api_key    => ENV['FREESOUND_KEY'],
      :base_url   => 'http://www.freesound.org/api',
      :sounds_url => 'http://www.freesound.org/api/sounds'
    }

    DEFAULTS.each_key do |key|
      eval <<-EOS
        def self.#{key}
          @@#{key} ||= DEFAULTS[:#{key}]
        end

        def self.#{key}=(val)
          @@#{key} = val
        end
      EOS
    end

    def self.method_missing(name, *args)
      raise(InvalidConfigurationParameterError, "#{name} is not a recognized configuration parameter")
    end
  end # module Configuration

  def self.configure(params={})
    params.each do |key, value|
      Configuration.send("#{key}=", value)
    end

    yield Configuration if block_given?
  end
end # module Freesound

require 'core_ext'
require 'freesound/client'
require 'freesound/request'
require 'freesound/uri_compiler'
require 'freesound/response'
require 'freesound/response_parser'
