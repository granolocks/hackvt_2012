
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
    name: "Massachusetts Border",
    description: "You are crossing into the beautiful, virginal state of Vermont. Isn't that nice? ",
    x: 23,
    y: 23,
    next_stop_id: 2
  },
  {
    name: "Prospect Rock",
    description: "You arrive at prospect rock. This shit is pretty damn wily.",
    x: 23,
    y: 23,
    next_stop_id: 3
  },
  {
    name: "Mad Tom Notch",
    description: "You arrive at Mad Tom Notch. Maybe Mad Tom is around somewhere. Maybe not. Maybe.",
    x: 23,
    y: 23,
    next_stop_id: 4
  },
  {
    name: "Litle Rock Pond",
    description: "They call this spot 'Little Rock Pond', but that rock isn't so little. It's pretty big, and it's moving...",
    x: 23,
    y: 23,
    next_stop_id: 5
  },
  {
    name: "Sunset Ledge",
    description: "The Sun Rises as you reach Sunset Ledge. Rises backwards. That's odd.",
    x: 23,
    y: 23,
    next_stop_id: 6
  },
  {
    name: "Molly Starks Balcony",
    description: "Molly Starks is stark naked on her balcony. She runs inside screaming as you approach.",
    x: 23,
    y: 23,
    next_stop_id: 7
  },
  {
    name: "Camels Hump",
    description: "You scramble up the rocky crag. On the summit you see humping camels, or, no, that's just the mountain.",
    x: 23,
    y: 23,
    next_stop_id: 8
  },
  {
    name: "Harringtons View",
    description: "What madness is this? What did Harrington really see from here? You may never know.. You are feeling pretty queasy and seem to be going blind. Also your palms are getting a bit hairy. Awkward.",
    x: 23,
    y: 23,
    next_stop_id: 9
  },
  {
    name: "Mt. Mansfield",
    description: "They call it Mansfield but you don't seen any men around. Or any fields. Just trees and rocks. And that huge Catamount. Uh-oh.",
    x: 23,
    y: 23,
    next_stop_id: 10
  },
  {
    name: "Sterling Pond",
    description: "This pond is more beautiful than anything you have ever seen. Ever. Anywhere. Seriously. Just look at it.",
    x: 23,
    y: 23,
    next_stop_id: 11
  },
  {
    name: "Madonna Peak",
    description: "A big storm is brewing as you summit Madonna Peak. Your mother must be rolling in her grave. You didn't even bring a rain jacket.",
    x: 23,
    y: 23,
    next_stop_id: 12
  },
  {
    name: "Devils Gulch",
    description: "Out of the storm and down into hell you descend. Actually it's quite nice down here, quite peaceful. But who is that fellow in the shadows? The one with the horns and the cleft feet.",
    x: 23,
    y: 23,
    next_stop_id: 13
  },
  {
    name: "Hazens Notch Camp",
    description: "Finally reached a real Camp. First time on this whole trek it seems. Too bad the camp is a haunted, dilapidated mess. A shiver runs up your spine.",
    x: 23,
    y: 23,
    next_stop_id: 14
  },
  {
    name: "Shooting Star Shelter",
    description: "Another shelter? Seriously? Two in a row? That star up there sure is bright... Sure is moving quickly. Towards you.",
    x: 23,
    y: 23,
    next_stop_id: 15
  },
  {
    name: "The Canadian Border",
    description: "You did it. You won. Whatever that means. Welcome to Canada, commie.",
    x: 23,
    y: 23,
    next_stop_id: nil
  },
]

stops.each do |s|
  Stop.first_or_create({name: s[:name]}, s)
end

solutions =[
  {
    description: "You might want to find some food before you travel too far...",
    stop_id: 1,
    required_item_type_id: 1
  },
  {
    description: "Hmm, the weather doesn't look great either, maybe you'd better find shelter.",
    stop_id: 1,
    required_item_type_id: 5
  },
  {
    description: "There seems to be a tree crossing the path... How could you ever clear it?",
    stop_id: 2,
    required_item_type_id: 3
  },
  {
    description: "Some how you are still hungry...",
    stop_id: 2,
    required_item_type_id: 1
  },
  {
    description: "Actually it seems like Mad Tom is attacking you!",
    stop_id: 3,
    required_item_type_id: 2
  },
  {
    description: "Not to mention you got soaked in a rain squall.. Gotta get dry somehow.",
    stop_id: 3,
    required_item_type_id: 4
  },
  {
    description: "You need to fight this Mountain Giant off!",
    stop_id: 4,
    required_item_type_id: 2
  },
  {
    description: "Maybe if you just hid he'd forget you are even here... May as well get a good nights sleep",
    stop_id: 4,
    required_item_type_id: 5
  },
  {
    description: "How did you get so hungry again? Must. Find. Food.",
    stop_id: 5,
    required_item_type_id: 1
  },
  {
    description: "On the other hand this strange weather is making you very sleep...",
    stop_id: 5,
    required_item_type_id: 5
  },
  {
    description: "Molly comes back out in a bathrobe with a firehose and sprays you down.",
    stop_id: 6,
    required_item_type_id: 4
  },
  {
    description: "It might work if you just tunneled under her house...",
    stop_id: 6,
    required_item_type_id: 5
  },
  {
    description: "These camels are making you uncomfortable, too bad you don't have anything to defend yourself. Or do you?",
    stop_id: 7,
    required_item_type_id: 2
  },
  {
    description: "Maybe if you distracted them with a meal they'd leave you alone.",
    stop_id: 7,
    required_item_type_id: 1
  },
  {
    description: "Sounds like you need some alone time anyway. I'ts been a long trip so far.",
    stop_id: 8,
    required_item_type_id: 5
  },
  {
    description: "Wait.. no.. On the other hand it seems more pressing to not starve to death for a change.",
    stop_id: 8,
    required_item_type_id: 1
  },
  {
    description: "That cat looks pissed. Better find a club fast.",
    stop_id: 9,
    required_item_type_id: 2
  },
  {
    description: "Maybe you can just toss a piece of steak into the forest and have him chase it. Maybe.",
    stop_id: 9,
    required_item_type_id: 1
  },
  {
    description: "You can't help but take a swim can you. Better not catch a cold!",
    stop_id: 10,
    required_item_type_id: 4
  },
  {
    description: "Maybe if you dig a trench out of the pond you can create a stream and then float down the other side of this mountain.. ",
    stop_id: 10,
    required_item_type_id: 3
  },
  {
    description: "Big storm. eh? Sure wouldn't hurt to stay dry!",
    stop_id: 11,
    required_item_type_id: 7
  },
  {
    description: "A little weather never scared you huh? Oops, looks like you are soaked now.",
    stop_id: 11,
    required_item_type_id: 4
  },
  {
    description: "Time to dance with the devil.",
    stop_id: 12,
    required_item_type_id: 2
  },
  {
    description: "Time to sleep with the devil.",
    stop_id: 12,
    required_item_type_id: 5
  },
  {
    description: "You must battle these ghosts. It is the only way.",
    stop_id: 13,
    required_item_type_id: 2
  },
  {
    description: "Battle ghosts? Why not just tear down the camp? That will sooth their tormented spirits.",
    stop_id: 13,
    required_item_type_id: 3
  },
  {
    description: "That star sure looks big. And dangerous. I bet your tent will protect you.",
    stop_id: 14,
    required_item_type_id: 5
  },
  {
    description: "Tent's not a gonna cut it! Good thing *someone* reminded you to bring a towel...",
    stop_id: 14,
    required_item_type_id: 4
  }
]
# This always needs to be after the stops have been added
User.first_or_create({username: 'admin'}, {
  password: 'admin',
  password_confirmation: 'admin'
})

