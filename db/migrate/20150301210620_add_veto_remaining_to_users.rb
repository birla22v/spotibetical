class AddVetoRemainingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :veto_remaining, :integer, default: 1
  end
end
