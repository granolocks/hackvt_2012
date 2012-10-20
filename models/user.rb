# encoding: utf-8

require 'scrypt'

class User
  include DataMapper::Resource

  # Not required becuase the getter is overridden to default to the first step
  belongs_to :current_stop, 'Stop', required: false

  def current_stop
    attribute_get(:current_stop) || Stop.first
  end

  ##### BEGIN AUTHENTICATION #####

  property :id,             Serial
  property :username,       String,   :required => true,
                                      :unique => true
  property :pass_hash,      String,   :required => true,
                                      :length => 64,
                                      :accessor => :protected
  property :salt,           String,   :required => true,
                                      :length => 32,
                                      :accessor => :protected

  # Password/Password Confirmation virtual attributes attr_accessor :password, :password_confirmation
  attr_accessor :password, :password_confirmation
  validates_presence_of :password, :password_confirmation
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

