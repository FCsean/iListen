class Song < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :playlists
  has_attached_file :song,
                    :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"
  validates_attachment_content_type :song, :content_type => /\Aaudio\/.*\Z/
  validates_presence_of :artist, :on => :create
  validates_presence_of :title, :on => :create
  validates_presence_of :song, :on => :create
  
  def set_user(user)
    self.user = user
  end
end
