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
  
  TYPES = ['video/mp4','video/mov','video/quicktime','video/mpeg', 'video/avi']

  # Logic and configuration for the file.
  include Attachment::Video      

  validates_attachment_presence :file
  validates_attachment_content_type :file, content_type: TYPES, 
    message: "Invalid video format."
  validates :title, :description, :presence => true

  process_in_background :file

  belongs_to :user

  attr_accessible :description, :title, :file, :file_meta


end
