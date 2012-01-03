module Freesound
  class Client
    attr_accessor :config

    def initialize(options={})
      @config = Configuration.new(options)
      yield @config if block_given?
    end

    def api_key
      @config.api_key
    end
  end
end
