# encoding: utf-8

class Item
  include DataMapper::Resource

  property :id,   Serial
  property :name, String, required: true, length: 255

  belongs_to :item_type

  # Sort of meaningless from this direction but mind as well include the two way
  # association.
  has n, :inventories
  has n, :users, through: :inventories
end

