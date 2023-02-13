class VoterpostsController < ApplicationController
  before_action :voter_only
  before_action :voter_id, only: [:index]
  before_action :correct_voter, only: [:index]

  # カテゴリー選択
  def index
    @posts = User.eager_load(:posts)
    @voter = Voter.find(current_voter.id)
    @voterposts = @voter.voterposts.all
  end

  # 一覧
  def show
    @posts = Post.eager_load(:user).where(category: params[:name]).paginate(page: params[:page], per_page: 100)
    @category = params[:name]
    @category_count = current_voter.favorites.where(category: params[:name]).count
  end

  # 確認画面
  def edit
    @check = current_voter.favorites.where(category: params[:format])
    @category = params[:format]
  end

  def update
    @voter = Voter.find(params[:id])
    @voterpost = @voter.voterposts.find_by(voter_id: params[:id])

    redirect_to voterpost_path(name: params[:format]) if params[:back]
    if params[:format].blank?
      flash[:danger] = "投票に失敗しました。"
      redirect_to voterposts_path
    else
      favorite_posts_hash.each do |key, value|
        if params[:format].include?(value)
          if params[key] == ""
            flash[:danger] = "No.1を入力してください。"
            redirect_to edit_voterpost_path(current_voter, format: value)
          elsif params[key].to_i
            @confirm_edit = current_voter.favorites.where(category: value)
            @confirm_edit.each do |confirm|
              @confirmid = confirm.id if confirm.id == params[key].to_i
            end
            if @confirmid == params[key].to_i
              @voter.voterposts.update(voterpost_params(key))
              flash[:success] = '投票ありがとうございました。'
              redirect_to voterposts_path
            else
              flash[:danger] = "投票したものから選んでNo. を入力してください"
              redirect_to edit_voterpost_path(current_voter, format: value)
            end
          end
        end
      end
    end
  end

  private

  def favorite_posts_hash
    {
      favorite_post1: "女性パワーで未来を変えるの部",
      favorite_post2: "ジェンダー・多様性の部",
      favorite_post3: "はたらく女子の部",
      favorite_post4: "ママ・子どもの部",
      favorite_post5: "名もなき家事の部",
      favorite_post6: "本当にありがとう❣️感謝の部",
      favorite_post7: "あるある❣️の部",
      favorite_post8: "涙がポロ❣️の部",
      favorite_post9: "輝け❣️私のライフスタイルの部",
      favorite_post10: "心がきゅん❣️私の癒しの部",
      favorite_post11: "SDGsアクションの部"
    }
  end

  def voterpost_params(key)
    # 例) key: :favorite_post1、reason: :reason1
    reason = "reason#{key.to_s[-1]}".to_sym
    params.permit(key, reason).merge(voter_id: current_voter.id)
  end
end
