class VoterpostsController < ApplicationController
  before_action :voter_only, only: [:index]
  def index
    @posts = User.eager_load(:posts)
    @favorite_posts = User.eager_load(:posts)
  end

  def show
    # チェックしたpostが入っている。
    @check = current_voter.favorites
    @voter = Voterpost.new(voterpost_params)
  end

  def create
    # byebug
    unless current_voter.favorites.include?(clicked_post)
      like = current_voter.likes.new(post_id: clicked_post.id)
      if like.save
        flash[:success] = '投稿に「いいね！」しました。'
        redirect_back(fallback_location: root_path)
      end
    end
   
  end

  def destroy
    current_voter.likes.find_by(post_id: params[:post_id]).destroy
    flash[:danger] = '「いいね！」を解除しました。'
    redirect_back(fallback_location: root_path)
  end


  def create_voterpost
    # byebug
    @voterpost = Voterpost.new(voterpost_params)
    if params[:back]
      redirect_to voterposts_path
    elsif @voterpost.save
      flash[:success] = '投票に成功しました。'
      redirect_to voterposts_path
    else
      flash[:danger] = "投票に失敗しました。<br>" + @user.errors.full_messages.join("<br>")
      redirect_to voterposts_path
    end

  end

  private

    def clicked_post
      Post.find(params[:post_id])
    end

    def voterpost_params
      params.permit(:favorite_post, :reason).merge(voter_id: current_voter.id)
    end

end 

