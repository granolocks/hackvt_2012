require 'rubygems'
require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/json'
require 'json'

module HackVt
  class Api < Sinatra::Base
     # Namespace Library
     register Sinatra::Namespace

    get '/' do
      "<h1>It Works</h1>"
    end
  end
end
