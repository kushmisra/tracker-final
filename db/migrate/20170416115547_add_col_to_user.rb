class AddColToUser < ActiveRecord::Migration
  def change
    add_column :users, :mob, :string
    add_column :users, :email, :string
  end
end
