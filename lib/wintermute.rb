$:.push("./")

require 'rubygems'
require 'json'

require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/json'

class Wintermute < Sinatra::Base
   register Sinatra::Namespace

   require 'config/environment'
end

require 'helpers/init'
require 'routes/init'
require 'models/init'
require 'config/seed'

