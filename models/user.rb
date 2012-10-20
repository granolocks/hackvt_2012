# encoding: utf-8

require 'scrypt'

class User
  include DataMapper::Resource

  # You don't see these... their names aren't the best...
  has n, :inventories
  has n, :items, through: :inventories

  has n, :suggested_activities
  # The following relation is ALL activities that have ever been suggested
  has n, :activities, through: :suggested_activities

  # Not required becuase the getter is overridden to default to the first step
  belongs_to :current_stop, 'Stop', required: false

  def initialize(*args)
    super
    self.current_stop = Stop.first
    new_suggestions
  end

  # Activities the user has completed
  def completed
    suggested_activities.complete.activities
  end

  def suggestions
    suggested_activities.suggestions.activities
  end

  def complete_activity(activity_id)
    sa = suggested_activities.all(activity_id: activity_id).first
    sa.completed = true
    sa.save

    self.items << Item.all(item_type: sa.activity.activity_type.reward_type).sample(1).first

    new_suggestions
    save
  end

  def dislike_activity(activity_id)
    sa = suggested_activities.all(activity_id: activity_id).first
    sa.not_interested = true
    sa.save

    new_suggestions
    save
  end

  def complete_stop!(item_type_name)
    it = current_stop.solutions.all(required_item_type: item_type_name).first
    possible_items = Item.all(item_type: it)

    used_item = inventory.all(item: possible_items).first

    if used_item
      inventory(item: used_item).first.delete

      current_stop = current_stop.next_stop
      new_suggestions
      save

      true
    else
      false
    end
  end

  def new_suggestions
    unless current_stop.solutions.empty?
      item_types = current_stop.solutions.required_item_type
      activities = ActivityType.all(reward_type: item_types).activities.all(:id.not => suggested_activities.unavailable.map(&:id)).limit(6)
    end
  end

  def inventory
    items
  end

  # Request counts of types of inventory items
  def inventory_counts
    type_counts = ItemType.all.inject({}) do |types, it|
      types[it.name] = 0;
      types
    end

    type_counts.merge(Hash[items.item_types.aggregate(:name, :name.count)])
  end

  ##### BEGIN AUTHENTICATION #####

  property :id,             Serial
  property :username,       String,   :required => true,
                                      :unique => true,
                                      :length => 255
  property :pass_hash,      String,   :required => true,
                                      :length => 64,
                                      :accessor => :protected
  property :salt,           String,   :required => true,
                                      :length => 32,
                                      :accessor => :protected

  # Password/Password Confirmation virtual attributes attr_accessor :password, :password_confirmation
  attr_accessor :password, :password_confirmation
  #validates_presence_of :password, :password_confirmation
  validates_confirmation_of :password

  # Class methods
  def self.authenticate(username, pass)
    current_user = first(:username => username)

    return nil if current_user.nil?
    return nil unless current_user.check_password(pass)

    current_user
  end

  # Instance methods
  def check_password(plaintext_password)
    (self.pass_hash == scrypt_helper(plaintext_password, self.salt))
  end

  def password=(plaintext_password)
    # For password_confirmation support
    @password = plaintext_password

    self.salt = SCrypt::Engine.generate_salt(:max_time => 1.0)
    self.pass_hash = scrypt_helper(plaintext_password, self.salt)
  end

  private

  def scrypt_helper(plaintext_password, salt)
    SCrypt::Engine.scrypt(plaintext_password, salt, SCrypt::Engine.autodetect_cost(salt), 32).unpack('H*').first
  end
end

