class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.string :address
      t.string :profession
      t.string :age
      t.string :note
      t.string :questionary

      t.timestamps
    end
  end
end
