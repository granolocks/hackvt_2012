$:.push("./")

require 'rubygems'
require 'sinatra/base'
require 'sinatra/namespace'
require 'sinatra/json'
require 'json'

require 'models/init'

module Wintermute
  class Api < Sinatra::Base
     # Namespace Library
     register Sinatra::Namespace

     # We are going to return json(for (almost) everything.
     before do

       # Set the content type
       content_type "application/json"

     end

     namespace "/api" do
       namespace "/v1" do
         get '/?' do
           { :it => "works" }.to_json
         end
       end
     end
  end
end
