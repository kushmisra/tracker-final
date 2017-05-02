class AddLockToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :lock, :string
  end
end
