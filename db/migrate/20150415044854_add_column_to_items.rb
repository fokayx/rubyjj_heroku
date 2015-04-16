class AddColumnToItems < ActiveRecord::Migration
  def change
    remove_column :items, :category
    add_column :items, :group, :string
  end
end
