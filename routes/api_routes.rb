
class Wintermute < Sinatra::Base
   namespace "/api" do
     # We are going to return json(for (almost) everything.
     before do
       content_type "application/json"
     end

     namespace "/v1" do
       get '/?' do
         { :it => "works" }.to_json
       end
     end
   end
end

