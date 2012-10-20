
User.first_or_create({username: 'admin'}, {
  password: 'admin',
  password_confirmation: 'admin'
})

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

