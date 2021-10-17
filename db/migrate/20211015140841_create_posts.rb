class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :first_phrase
      t.string :second_phrase
      t.string :third_phrase
      t.string :pen_name
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
