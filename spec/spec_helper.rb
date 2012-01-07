$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'freesound'
#require 'webmock/rspec'

include Freesound

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.before do
    Freesound::Configuration.api_key = ENV['FREESOUND_KEY'] || fail("Register your app at freesound.org and store your key in the $FREESOUND_KEY variable.")
  end
end
