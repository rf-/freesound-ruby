require 'net/http'
require 'uri'
#require 'json/ext'
#require 'nokogiri'
require 'crack'

YAML::ENGINE.yamler= 'syck'

module Freesound
  def self.root_dir
    File.expand_path('..', File.dirname(__FILE__))
  end

  module Configuration
    DEFAULTS = {
      :api_key     => ENV['FREESOUND_KEY'],
      :base_url    => 'http://www.freesound.org/api',
      :sounds_url  => 'http://www.freesound.org/api/sounds'
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
  end
end

require 'core_ext'
require 'freesound/client'
require 'freesound/request'
require 'freesound/uri_compiler'
require 'freesound/response'
require 'freesound/response_parser'
