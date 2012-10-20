# encoding: utf-8

class SuggestedActivity
  include DataMapper::Resource

  property :id,           Serial

  property :completed,      Boolean, default: false
  property :not_interested, Boolean, default: false

  belongs_to :user

  belongs_to :suggested_at_stop, 'Stop'
  belongs_to :activity

  # Activities that have been completed
  def self.complete
    all(completed: true)
  end

  # Activities that a user hasn't completed yet
  def self.uncomplete
    all(completed: false)
  end

  # Activities that a user hasn't rejected yet
  def self.interested
    all(not_interested: false)
  end

  def self.suggestions
    all(suggested_at_stop: user.current_stop).uncomplete.interested
  end
end

