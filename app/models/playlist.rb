class Playlist < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :songs
  validates_presence_of :name, :on => :create
  validates_uniqueness_of :name
end
