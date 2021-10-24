class CreateVoterposts < ActiveRecord::Migration[5.2]
  def change
    create_table :voterposts do |t|
      t.string :favorite_post
      t.string :reason
      t.references :voter, foreign_key: true

      t.timestamps
    end
  end
end
