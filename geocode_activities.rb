#!/usr/bin/env ruby

$:.push("./")

require "lib/wintermute"
require "json"
require "geocoder"

activities = Activity.ungeocoded

activities.each do |a|
  results = Geocoder.search(a.address)

  unless results.empty?
    a.latitude = results.first.latitude
    a.longitude = results.first.longitude
    a.address = results.first.formatted_address
    a.save
  end
end

