class AddLikePostToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :like_post, :string
  end
end
