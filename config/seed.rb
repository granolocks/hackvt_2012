
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

