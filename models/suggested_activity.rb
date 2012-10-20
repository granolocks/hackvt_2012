# encoding: utf-8

class SuggestedActivity
  include DataMapper::Resource

  property :id,           Serial

  property :completed,      Boolean, default: false
  property :not_interested, Boolean, default: false

  belongs_to :user

  belongs_to :suggested_at_stop, 'Stop'
  belongs_to :activity
end

