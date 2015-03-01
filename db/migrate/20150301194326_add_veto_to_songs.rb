class AddVetoToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :veto, :boolean, default: true
  end
end
