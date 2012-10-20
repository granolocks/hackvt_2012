# encoding: utf-8

class Activity
  include DataMapper::Resource

  property :id,           Serial
  property :name,         String, required: true, length: 255
  property :description,  Text
  property :website,      String, length: 255

  property :address,      String, length: 255
  property :latitude,     String
  property :longitude,    String

  belongs_to :activity_type

  def self.geocoded
    all(:latitude.not => nil, :longitude.not => nil)
  end

  def self.ungeocoded
    all(latitude: nil) | all(longitude: nil)
  end

  def attributes
    super.merge({item_type: self.activity_type.reward_type.name })
  end

end

