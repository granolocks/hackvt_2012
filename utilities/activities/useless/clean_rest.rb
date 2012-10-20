# sample:
# {"telephone"=>"(802) 862-2863", "latitude"=>44.449806, "longitude"=>-73.147133, "name"=>"Kountry Kart Cafe", "address"=>"30 Community Dr Ste 2 South Burlington VT US", "description"=>"Food & Beverage > Cafes, Coffee Houses & Tea Houses"}

# Goals:
# name,website,address,latitude,longitude,description,phone

rs = eval(File.read("restaurants.rb"))


new = rs.inject([]) do |c,h|
 ha = {}
 ha["latitude"] = h["latitude"]
 ha["longitude"] = h["longitude"]
 ha["name"] = h["name"]
 ha["address"] = h["address"]
 ha["description"] = h["description"]
 c << ha
 c
end

f = File.open("cleaned_restaurants_hash.rb", "w+")
f.write(new)
f.close

