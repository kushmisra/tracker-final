class AddLockToUser < ActiveRecord::Migration
  def change
    add_column :users, :lock, :string
  end
end
