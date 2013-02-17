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
#  file_meta         :text
#

class Video < ActiveRecord::Base
  
  has_attached_file :file,
    :url => "/assets/videos/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/videos/:id/:style/:basename.:extension",
    :processors => [:ffmpeg],
    :styles => lambda { |video| {
            :mp4 => { :format => 'mp4',
              :convert_options => { :output => { 
                vf: video.instance.transposition, t: '60'} } }
                  }
                }

  process_in_background :file

  validates_attachment_presence :file
  validates :title, :description, :presence => true

  belongs_to :user

  attr_accessible :description, :title, :file, :file_meta

  def transposition
    if file.queued_for_write[:original]
      path = file.queued_for_write[:original].path
      rotation = MiniExiftool.new(path).rotation
      return "transpose=1" if rotation == 90
      return "transpose=2" if rotation == 270
      return "vflip,hflip" if rotation == 180
    end
  end

end
