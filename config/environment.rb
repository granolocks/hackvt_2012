
Wintermute::configure do |config|
  config.logging  = true
  config.root     = File.expand_path(File.dirname(__FILE__) + "/..")
  config.run      = true
  config.sessions = true

  # TODO remove this
  config.protection = false
end

