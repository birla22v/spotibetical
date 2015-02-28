class AddDetailsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :user_id, :integer
    add_column :songs, :name, :string
    add_column :songs, :artist, :string
  end
end
