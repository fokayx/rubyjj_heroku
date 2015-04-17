class AddColunmToItems < ActiveRecord::Migration
  def change
    add_column :items, :hospital_id, :integer, :limit => 4 
  end
end
