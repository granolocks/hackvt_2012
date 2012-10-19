$:.unshift File.dirname(File.expand_path(File.join(__FILE__,".")))
require 'thin'
require 'hackvt-api' # Loads the app(s)

run HackVt::Api.new
