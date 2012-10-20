# encoding: utf-8

require 'scrypt'

class Stop
  include DataMapper::Resource

  property :id,           Serial
  property :name,         String,   required: true, unique: true
  property :description,  Text,     required: true
  property :x,            Integer,  required: true
  property :y,            Integer,  required: true

  belongs_to :next_stop, 'Stop', required: false
  has 1, :prev_stop, 'Stop', child_key: :next_stop_id, required: false
end

