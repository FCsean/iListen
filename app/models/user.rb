class User < ActiveRecord::Base
  has_many :songs
  has_many :playlists
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :username, :on => :create
  validates_presence_of :name, :on => :create
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :username
  
  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, salt)
    end
  end
end
