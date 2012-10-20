stores = eval(File.read("outfile.txt"))

#{"address"=>"30 Community Dr", "address_extended"=>"Ste 2", "category"=>"Food & Beverage > Cafes, Coffee Houses & Tea Houses", "country"=>"US", "cuisie"=>"Cafe", "factual_id"=>"23dfce60-be42-4c2d-80b3-d39753a01e23", "latitude"=>44.449806, "locality"=>"South Burlington", "longitude"=>-73.147133, "nam"=>"Kountry Kart Cafe", "postcode"=>"05403", "price"=>1, "region"=>"VT", "status"=>"1", "tel"=>"(802) 862-2863"}

new_out = stores.inject([]) do |c,h|
  new = {}
  new["telephone"] = h["tel"] unless (h["tel"] == nil)
  new["latitude"] = h["latitude"] unless (h["latitude"] == nil)
  new["longitude"] = h["longitude"] unless (h["longitude"] == nil)
  new["name"] = h["nam"] unless (h["nam"] == nil)
  new["name"] = h["name"] unless (h["name"] == nil)
  addr = ""
  addr << h["address"] unless (h["address"] == nil)
  addr << " "
  addr << h["address_extended"] unless (h["address_extended"] == nil)
  addr << " "
  addr << h["locality"] unless (h["locality"] == nil)
  addr << " "
  addr << h["region"] unless (h["region"] == nil)
  addr << " "
  addr << h["country"] unless (h["country"] == nil)
  new["address"] = addr
  new["description"] =  h["category"] unless (h["category"] == nil)
  puts new.inspect
  c << new
  c
end

f = File.open("new_out.txt","w+")
f.write new_out
f.close

