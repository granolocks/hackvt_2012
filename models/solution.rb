# encoding: utf-8

class Solution
  include DataMapper::Resource

  property :id,           Serial
  property :description,  Text,     required: true

  belongs_to :stop
  belongs_to :required_item_type, 'ItemType'
end

