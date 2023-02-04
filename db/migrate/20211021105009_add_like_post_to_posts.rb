class AddLikePostToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :like_post, :boolean, default: :false
  end
end
