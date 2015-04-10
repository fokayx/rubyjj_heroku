class HelloSerialize < ActiveRecord::Migration
  def change

   # rename_column :items, :category_id, :category
   # change_column :items, :category, :string
   # rename_column :exams, :description, :category
    change_column :exams, :category, :string

    change_column :exams, :gender, :string, limit: 2
   # drop_table :examlists
   # drop_table :categories
   # drop_table :managers
    # 註掉是因為一直噴錯的過程中，他就做了，也沒取消，所以只好手動註解

  end
end
