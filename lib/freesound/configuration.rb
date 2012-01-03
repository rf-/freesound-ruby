module Freesound
  class Configuration
    OPTIONS = [:api_key]

    OPTIONS.each { |opt| attr_accessor opt }

    def initialize(options={})
      options.each do |k, v|
        instance_variable_set("@#{k}", v) if OPTIONS.include?(k)
      end
    end
  end
end
