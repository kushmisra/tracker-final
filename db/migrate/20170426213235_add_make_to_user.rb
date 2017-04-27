class AddMakeToUser < ActiveRecord::Migration
  def change
    add_column :users, :make, :string
  end
end
