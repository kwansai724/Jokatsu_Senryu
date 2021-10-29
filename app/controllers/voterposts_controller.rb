class VoterpostsController < ApplicationController
  before_action :voter_only, only: [:index]
  before_action :voter_id, only: [:index]

  # カテゴリー選択
  def index
    @posts = User.eager_load(:posts)
    # @favorite_posts = User.eager_load(:posts)

    #終わったら消す↓２行 
    @voter = Voter.find(current_voter.id)
    @voterpost = @voter.voterposts.all
  end

  # 一覧
  def show
    @posts = User.eager_load(:posts)
    
  end
  
  # 確認画面
  def edit
    # チェックしたpostが入っている。
    @check = current_voter.favorites
    # @voter = Voterpost.new(voterpost_params)
  end
  
  def update
    # byebug
    @voter = Voter.find(params[:id])
    @voterpost = @voter.voterposts.find_by(voter_id: params[:voter_id])
    if params[:back]
      redirect_to voterpost_path
    elsif @voter.voterposts.update(voterpost_params)
      flash[:success] = '投票ありがとうございました。'
      redirect_to voterposts_path
    else
      flash[:danger] = "投票に失敗しました。" 
      redirect_to voterposts_path
    end
  end

  private

    def voterpost_params
      params.permit(:favorite_post, :reason).merge(voter_id: current_voter.id)
      # params.require(:voterpost).permit(:favorite_post, :reason).merge(voter_id: current_voter.id)
    end

end 


