class AddAttachmentFileToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :videos, :file
  end
end
