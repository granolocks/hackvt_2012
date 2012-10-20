
class Wintermute < Sinatra::Base
   namespace "/api" do
     # We are going to return json(for (almost) everything.
     before do
       content_type "application/json"
     end

     namespace "/v1" do

       namespace '/stops' do
          namespace '/:id' do
             get '/?' do
               { :stop => {
                   :id => 2,
                   :name => "Prospect Rock",
                   :description => "You approach Prospect Rock. At the base of the rock you see a bear who seems to be threatening you."
                 },
                 :solutions => [
                   {
                     :description => "You can fight the bear.",
                     :required_item => "Weapon"
                   },
                   {
                     :description => "You can lure the bear away.",
                     :required_item => "Food"
                   },
                ],
                :inventory => {
                   "Food" => 0,
                   "Weapon" => 0,
                   "Tool" => 1,
                   "Towel" => 0,
                   "Tent" => 0,
                 }
               }.to_json
             end

             get '/activities/?' do
               {
                 :activities => [
                   {
                     :id => 1,
                     :name => "This Is my Activity",
                     :description => "This is a thing you can do.",
                     :address => "123 shitbox lane",
                     :website => "http://doshit.com",
                     :latitude => "44.476268",
                     :longitude => "-73.209329",
                     :item_type => "Weapon"
                   },
                   {
                     :id => 2,
                     :name => "This Is my Activity",
                     :description => "This is a thing you can do.",
                     :address => "123 shitbox lane",
                     :website => "http://doshit.com",
                     :latitude => "44.476268",
                     :longitude => "-73.209329",
                     :item_type => "Weapon"
                   },
                   {
                     :id => 3,
                     :name => "This Is my Activity",
                     :description => "This is a thing you can do.",
                     :address => "123 shitbox lane",
                     :website => "http://doshit.com",
                     :latitude => "44.476268",
                     :longitude => "-73.209329",
                     :item_type => "Food"
                   },
                   {
                     :id => 4,
                     :name => "This Is my Activity",
                     :description => "This is a thing you can do.",
                     :address => "123 shitbox lane",
                     :website => "http://doshit.com",
                     :latitude => "44.476268",
                     :longitude => "-73.209329",
                     :item_type => "Food"
                   }
                 ]
               }.to_json
             end
          end
       end
     end
   end
end

