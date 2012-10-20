
item_types = [
  { name: "food" },
  { name: "weapon" },
  { name: "tool" },
  { name: "towel" },
  { name: "tent" },
]

item_types.each do |it|
  ItemType.first_or_create({name: it[:name]}, it)
end

activity_types = [
  "hike",
  "farmers_market",
  "restaurant",
  "museum",
  "historical_site",
  "swimming_hole",
  "ski_resort"
]

activity_types.each do |name|
  ActivityType.first_or_create({name: name})
end

stops = [
  {
    name: "Masshole Border",
    description: "Where dem bastards are that come in and drive us crazy",
    x: 23,
    y: 23
  }
]

stops.each do |s|
  Stop.first_or_create({name: s[:name]}, s)
end

# This always needs to be after the stops have been added
User.first_or_create({username: 'admin'}, {
  password: 'admin',
  password_confirmation: 'admin'
})

