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

  belongs_to :activity_type

  def self.geocoded
    all(:latitude.not => nil, :longitude.not => nil)
  end

  def self.ungeocoded
    all(latitude: nil) | all(longitude: nil)
  end
end

