class AddBasicinfoToVoters < ActiveRecord::Migration[5.2]
  def change
    add_column :voters, :name, :string
    add_column :voters, :group, :string
    add_column :voters, :favorite_post, :string
    add_column :voters, :reason, :string
    add_column :voters, :admin, :boolean, default: false
  end
end
