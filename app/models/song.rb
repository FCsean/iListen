class Song < ActiveRecord::Base
  belongs_to :user
  has_attached_file :song  ,
                    :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"

  # validates_attachment_content_type :song, :content_type => /\Aaudio\/.*\Z/
end
