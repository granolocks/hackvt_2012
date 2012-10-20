# encoding: utf-8

class ActivityType
  include DataMapper::Resource

  property :id,           Serial
  property :name,         String, required: true, length: 255

  has n, :activities

  belongs_to :reward_type, 'ItemType'
end

