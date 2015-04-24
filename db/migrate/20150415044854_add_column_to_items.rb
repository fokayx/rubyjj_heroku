class AddColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :group, :string
  end
end
