
require "geocoder"

Geocoder.configure do |config|
  config.lookup = :google
  config.cache = {}
  config.timeout = 10
end

