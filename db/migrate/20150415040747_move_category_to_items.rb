class MoveCategoryToItems < ActiveRecord::Migration
  def change
    remove_column :packages, :category
    remove_column :items, :description
  end
end
