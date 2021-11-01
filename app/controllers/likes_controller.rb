class LikesController < ApplicationController
  def create
    unless current_voter.favorites.include?(clicked_post)
      like = current_voter.likes.new(post_id: clicked_post.id)
      if like.save
        flash[:success] = '投票しました。'
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def destroy
    current_voter.likes.find_by(post_id: params[:post_id]).destroy
    flash[:danger] = '投票を解除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

    def clicked_post
      Post.find(params[:post_id])
    end

end
