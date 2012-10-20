# encoding: utf-8

class Inventory
  include DataMapper::Resource

  property :id,   Serial

  belongs_to :user
  belongs_to :item
end

