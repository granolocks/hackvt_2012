#!/usr/bin/env ruby

$:.push("./")

require "lib/wintermute"
require "json"
require "geocoder"

activity_hashes = []
activity_type_hashes = []

activities = Activity.all
activities.each do |a|
  activity_hashes << a.attributes
end

activity_types = ActivityType.all
activity_types.each do |at|
  activity_type_hashes << at.attributes
end

File.open('data/activity_backup.json', 'w') { |f| f.write(JSON.pretty_generate(activity_hashes)) }
File.open('data/activity_type_backup.json', 'w') { |f| f.write(JSON.pretty_generate(activity_type_hashes)) }

