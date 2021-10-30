class CreateVoterposts < ActiveRecord::Migration[5.2]
  def change
    create_table :voterposts do |t|
      t.integer :favorite_post1
      t.string :reason1
      t.integer :favorite_post2
      t.string :reason2
      t.integer :favorite_post3
      t.string :reason3
      t.integer :favorite_post4
      t.string :reason4
      t.integer :favorite_post5
      t.string :reason5
      t.integer :favorite_post6
      t.string :reason6
      t.integer :favorite_post7
      t.string :reason7
      t.integer :favorite_post8
      t.string :reason8
      t.integer :favorite_post9
      t.string :reason9
      t.integer :favorite_post10
      t.string :reason10
      t.integer :favorite_post11
      t.string :reason11

      t.references :voter, foreign_key: true

      t.timestamps
    end
  end
end
