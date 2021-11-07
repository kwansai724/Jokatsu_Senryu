class AddOtherToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :other, :string
  end
end
