$:.unshift File.dirname(File.expand_path(File.join(__FILE__,".")))
require 'thin'
require 'wintermute-api' # Loads the app(s)

run Wintermute::Api.new
