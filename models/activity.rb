# encoding: utf-8

class Activity
  include DataMapper::Resource

  property :id,           Serial
  property :name,         String, required: true
  property :description,  Text
  property :website,      String

  property :address,      String
  property :latitude,     String
  property :longitude,    String

  has 1, :activity_type
end

