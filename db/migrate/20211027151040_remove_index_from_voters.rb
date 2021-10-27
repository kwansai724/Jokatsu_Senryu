class RemoveIndexFromVoters < ActiveRecord::Migration[5.2]
  def change
    remove_index :voters, column: :email
    add_index :voters, :name, unique: true
  end
end
