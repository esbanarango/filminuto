class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.integer :duration

      t.integer :likes_count
      t.integer :dislikes_count
      t.integer :views_count
      
      t.references :user

      t.timestamps
    end
    add_index :videos, :user_id
  end
end
