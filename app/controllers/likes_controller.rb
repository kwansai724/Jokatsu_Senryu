class LikesController < ApplicationController

  def create
    if current_voter.like_this(clicked_post)
      flash[:success] = '投稿に「いいね！」しました。'
      redirect_back(fallback_location: posts_index_path)
    end
  end

  def destroy
    current_voter.likes.find_by(post_id: params[:post_id]).destroy
    flash[:danger] = '「いいね！」を解除しました。'
    redirect_back(fallback_location: posts_index_path)
  end

  private

  def clicked_post
    Post.find(params[:post_id])
  end
end
