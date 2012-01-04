require 'net/http'
require 'uri'
require 'json/ext'
require 'xmlsimple'

module Freesound
  module Configuration
    DEFAULTS = {
      :api_key  => ENV['FREESOUND_KEY'],
      :base_url => 'http://www.freesound.org/api',
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
  end
end

require 'core_ext'
require 'freesound/client'
require 'freesound/request'
require 'freesound/api'
