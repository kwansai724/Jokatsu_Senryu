class LikesController < ApplicationController
  def create
    unless current_voter.favorites.include?(clicked_post)
      @user = User.find(@post.user_id)
      like = current_voter.likes.new(post_id: clicked_post.id)
      like.save
    end
  end

  def destroy
    
    @post = Post.find(params[:post_id])
    @user = User.find(@post.user_id)
    current_voter.likes.find_by(post_id: params[:post_id]).destroy
  end

  private

    def clicked_post
      @post = Post.find(params[:post_id])
    end

end
