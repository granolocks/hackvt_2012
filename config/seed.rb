
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
  { name: "hike", reward_type: ItemType.all(name: "weapon").first },
  { name: "farmers_market", reward_type: ItemType.all(name: "food").first },
  { name: "museum", reward_type: ItemType.all(name: "weapon").first },
  { name: "historical_site", reward_type: ItemType.all(name: "tool").first },
  { name: "swimming_hole", reward_type: ItemType.all(name: "towel").first },
  { name: "ski_resort", reward_type: ItemType.all(name: "tent").first }
]

activity_types.each do |at|
  ActivityType.first_or_create({name: at[:name]}, at)
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

