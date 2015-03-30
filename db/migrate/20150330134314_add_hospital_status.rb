class AddHospitalStatus < ActiveRecord::Migration
  def change
    add_column :hospitals, :status, :boolean, default: false
  end
end
