class Video < ActiveRecord::Base
  
  has_attached_file :file, :styles => { 
      :medium => { :geometry => "640x480", :format => 'mp4', :time => 60 }
    }, :processors => [:ffmpeg],
    :url => "/assets/videos/:id/:style/:basename.:extension",  
    :path => ":rails_root/public/assets/videos/:id/:style/:basename.:extension" 

  validates_attachment_presence :file

  belongs_to :user

  attr_accessible :description, :title, :file

end
