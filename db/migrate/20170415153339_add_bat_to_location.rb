class AddBatToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :battery, :string
  end
end
