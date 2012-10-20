
item_types = [
  { name: "food" },
  { name: "weapon" },
  { name: "tool" },
  { name: "towel" },
  { name: "tent" },
]

item_types.each do |it|
  it = ItemType.first_or_create({name: it[:name]}, it)
  i = Item.first_or_create({name: it[:name]}, {item_type: it})
end

activity_types = [
  { name: "hike", reward_type: ItemType.all(name: "weapon").first },
  { name: "farmers_market", reward_type: ItemType.all(name: "food").first },
  { name: "museum", reward_type: ItemType.all(name: "weapon").first },
  { name: "restaurant", reward_type: ItemType.all(name: "food").first },
  { name: "historical_site", reward_type: ItemType.all(name: "tool").first },
  { name: "swimming_hole", reward_type: ItemType.all(name: "towel").first },
  { name: "ski_resort", reward_type: ItemType.all(name: "tent").first }
]

activity_types.each do |at|
  ActivityType.first_or_create({name: at[:name]}, at)
end

stops = [
  {
    name: "Massachusetts Border",
    description: "You are crossing into the beautiful, virginal state of Vermont. Isn't that nice? You might want to find food first, or maybe shelter.. Weather looks nasty. ",
    x: 0,
    y: 23,
    next_stop_id: 2
  },
  {
    name: "Prospect Rock",
    description: "You arrive at prospect rock. This shit is pretty damn wily. There is a tree crossing the trail.",
    x: 6,
    y: 23,
    next_stop_id: 3
  },
  {
    name: "Mad Tom Notch",
    description: "You arrive at Mad Tom Notch. Maybe Mad Tom is around somewhere. Maybe not. Maybe. Actually it seems like Mad Tom is attacking you.",
    x: 12,
    y: 23,
    next_stop_id: 4
  },
  {
    name: "Litle Rock Pond",
    description: "They call this spot 'Little Rock Pond', but that rock isn't so little. It's pretty big, and it's moving... It's a Giant!",
    x: 18,
    y: 23,
    next_stop_id: 5
  },
  {
    name: "Sunset Ledge",
    description: "The Sun Rises as you reach Sunset Ledge. Rises backwards. That's odd. You feel hungry but the weather has turned to shit.",
    x: 24,
    y: 23,
    next_stop_id: 6
  },
  {
    name: "Molly Starks Balcony",
    description: "Molly Starks is stark naked on her balcony. She runs inside screaming as you approach.Suddenly, Molly comes back out in a bathrobe with a firehose and sprays you down.",
    x: 30,
    y: 23,
    next_stop_id: 7
  },
  {
    name: "Camels Hump",
    description: "You scramble up the rocky crag. On the summit you see humping camels, or, no, that's just the mountain. No, wait, it's camels. These camels are making you uncomfortable, too bad you don't have anything to defend yourself. Or do you?",
    x: 36,
    y: 23,
    next_stop_id: 8
  },
  {
    name: "Harringtons View",
    description: "What madness is this? What did Harrington really see from here? You may never know.. You are feeling pretty queasy and seem to be going blind. Also your palms are getting a bit hairy. Awkward. Sounds like you need some alone time anyway. I'ts been a long trip so far.",
    x: 42,
    y: 23,
    next_stop_id: 9
  },
  {
    name: "Mt. Mansfield",
    description: "They call it Mansfield but you don't seen any men around. Or any fields. Just trees and rocks. And that huge Catamount. Uh-oh.",
    x: 48,
    y: 23,
    next_stop_id: 10
  },
  {
    name: "Sterling Pond",
    description: "This pond is more beautiful than anything you have ever seen. Ever. Anywhere. Seriously. Just look at it. Looks like a nice swimming pond. Maybe if you dig a trench out of the pond you can create a stream and then float down the other side of this mountain.. ",
    x: 55,
    y: 23,
    next_stop_id: 11
  },
  {
    name: "Madonna Peak",
    description: "A big storm is brewing as you summit Madonna Peak. Your mother must be rolling in her grave. You didn't even bring a rain jacket.",
    x: 66,
    y: 23,
    next_stop_id: 12
  },
  {
    name: "Devils Gulch",
    description: "Out of the storm and down into hell you descend. Actually it's quite nice down here, quite peaceful. But who is that fellow in the shadows? The one with the horns and the cleft feet.",
    x: 75,
    y: 23,
    next_stop_id: 13
  },
  {
    name: "Hazens Notch Camp",
    description: "Finally reached a real Camp. First time on this whole trek it seems. Too bad the camp is a haunted, dilapidated mess. A shiver runs up your spine.",
    x: 84,
    y: 23,
    next_stop_id: 14
  },
  {
    name: "Shooting Star Shelter",
    description: "Another shelter? Seriously? Two in a row? That star up there sure is bright... Sure is moving quickly. Towards you.",
    x: 90,
    y: 23,
    next_stop_id: 15
  },
  {
    name: "The Canadian Border",
    description: "You did it. You won. Whatever that means. Welcome to Canada, commie.",
    x: 100,
    y: 23,
    next_stop_id: nil
  },
]

stops.each do |s|
  Stop.first_or_create({name: s[:name]}, s)
end

solutions =[
  {
    description: "I want food!",
    stop_id: 1,
    required_item_type_id: 1
  },
  {
    description: "Shelter it is!",
    stop_id: 1,
    required_item_type_id: 5
  },
  {
    description: "Clear the tree!",
    stop_id: 2,
    required_item_type_id: 3
  },
  {
    description: "Naw, I'll just eat.",
    stop_id: 2,
    required_item_type_id: 1
  },
  {
    description: "Fight Mad Tom",
    stop_id: 3,
    required_item_type_id: 2
  },
  {
    description: "Run and camp elsewhere!",
    stop_id: 3,
    required_item_type_id: 4
  },
  {
    description: "I'ma fight da Giant!",
    stop_id: 4,
    required_item_type_id: 2
  },
  {
    description: "Naw, shelter for me.",
    stop_id: 4,
    required_item_type_id: 5
  },
  {
    description: "Must. Find. Food.",
    stop_id: 5,
    required_item_type_id: 1
  },
  {
    description: "Must. Find. Shelter.",
    stop_id: 5,
    required_item_type_id: 5
  },
  {
    description: "Dry off!",
    stop_id: 6,
    required_item_type_id: 4
  },
  {
    description: "Tunnel away under the mt..",
    stop_id: 6,
    required_item_type_id: 5
  },
  {
    description: "Fight Camels",
    stop_id: 7,
    required_item_type_id: 2
  },
  {
    description: "Feed Camels",
    stop_id: 7,
    required_item_type_id: 1
  },
  {
    description: "Spend some 'Alone Time'",
    stop_id: 8,
    required_item_type_id: 5
  },
  {
    description: "Naw, I'm hungry",
    stop_id: 8,
    required_item_type_id: 1
  },
  {
    description: "Fight the cat!",
    stop_id: 9,
    required_item_type_id: 2
  },
  {
    description: "Bait Cat with Food",
    stop_id: 9,
    required_item_type_id: 1
  },
  {
    description: "Take a swim",
    stop_id: 10,
    required_item_type_id: 4
  },
  {
    description: "Divert Stream",
    stop_id: 10,
    required_item_type_id: 3
  },
  {
    description: "Stay Dry",
    stop_id: 11,
    required_item_type_id: 7
  },
  {
    description: "Get Dry",
    stop_id: 11,
    required_item_type_id: 4
  },
  {
    description: "Dance with the Devil",
    stop_id: 12,
    required_item_type_id: 2
  },
  {
    description: "Sleep with the Devil",
    stop_id: 12,
    required_item_type_id: 5
  },
  {
    description: "Battle The Ghosts",
    stop_id: 13,
    required_item_type_id: 2
  },
  {
    description: "Demo the Camp",
    stop_id: 13,
    required_item_type_id: 3
  },
  {
    description: "Hide in Tent",
    stop_id: 14,
    required_item_type_id: 5
  },
  {
    description: "Hide behind Towel",
    stop_id: 14,
    required_item_type_id: 4
  }
]

solutions.each do |s|
  Solution.first_or_create({description: s[:description]}, s)
end
# This always needs to be after the stops have been added
User.first_or_create({username: 'admin'}, {
  password: 'admin',
  password_confirmation: 'admin'
})

# This always needs to be after the stops have been added
User.first_or_create({username: 'gabe'}, {
  password: 'gabe',
  password_confirmation: 'gabe',
  current_stop_id: 1
})
