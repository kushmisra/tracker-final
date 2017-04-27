class AddMakeToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :make, :string
  end
end
