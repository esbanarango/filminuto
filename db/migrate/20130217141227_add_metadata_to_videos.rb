class AddMetadataToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :file_meta, :text
  end
end
