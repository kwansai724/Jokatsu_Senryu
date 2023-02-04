class CreateGroupEmailComments < ActiveRecord::Migration[5.2]
  def change
    create_table :group_email_comments do |t|
      t.string :comment
      t.string :subject
      t.references :staff, foreign_key: true

      t.timestamps
    end
  end
end
