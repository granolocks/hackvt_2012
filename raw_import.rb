#!/usr/bin/env ruby

$:.push("./")

require "lib/wintermute"
require "json"

farmers_markets = eval(File.read("utilities/activities/farmers_markets.rb"))
hikes = eval(File.read("utilities/activities/hikes.rb"))
historical_sites = eval(File.read("utilities/activities/historical_sites.rb"))
museums = eval(File.read("utilities/activities/museums.rb"))
restaurants = eval(File.read("utilities/activities/restaurants.rb"))
ski_resorts = eval(File.read("utilities/activities/ski_resorts.rb"))
swimming_holes = eval(File.read("utilities/activities/swimming_holes.rb"))

queue = []
failed = []

ati = ActivityType.all(name: "farmers_market").first.id
queue += (farmers_markets.map { |fm| fm.merge({activity_type_id: ati}) })

ati = ActivityType.all(name: "hike").first.id
queue += (hikes.map { |h| h.merge({activity_type_id: ati}) })

ati = ActivityType.all(name: "historical_site").first.id
queue += (historical_sites.map { |hs| hs.merge({activity_type_id: ati}) })

ati = ActivityType.all(name: "museum").first.id
queue += (museums.map { |m| m.merge({activity_type_id: ati}) })

ati = ActivityType.all(name: "restaurant").first.id
queue += (restaurants.map { |r| r.merge({activity_type_id: ati}) })

ati = ActivityType.all(name: "ski_resort").first.id
queue += (ski_resorts.map { |s| s.merge({activity_type_id: ati}) })

ati = ActivityType.all(name: "swimming_hole").first.id
queue += (swimming_holes.map { |sh| sh.merge({activity_type_id: ati}) })

queue.each do |a|
  r = Activity.create(a)

  if r.id.nil?
    failed << a
  end
end

unless failed.empty?
  File.open('failed.json', 'w') { |f| f.write(JSON.pretty_generate(failed)) }
end

