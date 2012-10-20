# encoding: utf-8

class Inventory
  include DataMapper::Resource

  property :id,   Serial
  property :random_time, DateTime, default: Time.now

  belongs_to :user
  belongs_to :item
end

