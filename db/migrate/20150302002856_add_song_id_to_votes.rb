class AddSongIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :song_id, :integer
    add_index :votes, :song_id
  end
end
