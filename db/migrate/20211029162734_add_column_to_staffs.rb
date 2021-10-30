class AddColumnToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :group_name, :string
    add_column :staffs, :category_name, :string
  end
end
