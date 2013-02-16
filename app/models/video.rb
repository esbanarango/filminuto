# == Schema Information
#
# Table name: videos
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  description       :text
#  duration          :integer
#  likes_count       :integer
#  dislikes_count    :integer
#  views_count       :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#

class Video < ActiveRecord::Base
  
  has_attached_file :file, :styles => { 
      :medium => { :geometry => "640x480", :format => 'mp4', :time => 60 }
    }, :processors => [:ffmpeg],
    :url => "/assets/videos/:id/:style/:basename.:extension",  
    :path => ":rails_root/public/assets/videos/:id/:style/:basename.:extension" 

  validates_attachment_presence :file
  validates :title, :description, :presence => true

  belongs_to :user

  attr_accessible :description, :title, :file

end
