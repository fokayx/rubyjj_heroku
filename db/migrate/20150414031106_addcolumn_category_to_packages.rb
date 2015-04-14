class AddcolumnCategoryToPackages < ActiveRecord::Migration
  def change
    remove_column :exams, :category
    remove_column :items, :category
    add_column :packages, :category, :string
  end
end
