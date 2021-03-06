# encoding: utf-8

class ItemType
  include DataMapper::Resource

  property :id,   Serial
  property :name, String, required: true, unique: true, length: 255
  property :icon, String, length: 255

  has n, :solutions, child_key: :required_item_type_id
  has n, :items
  has n, :activity_types, child_key: :reward_type_id
end

