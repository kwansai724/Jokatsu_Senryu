class AddPostLikeToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :like_post, :boolean, default: false
  end
end
