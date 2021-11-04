class VoterpostsController < ApplicationController
  before_action :voter_only, only: [:index]
  before_action :voter_id, only: [:index]

  # カテゴリー選択
  def index
    @posts = User.eager_load(:posts) 
    @voter = Voter.find(current_voter.id)
    @voterposts = @voter.voterposts.all
  end

  # 一覧
  def show
    if params[:name] == "女性パワーで未来を変えるの部"
      @posts = User.eager_load(:posts).where(posts: {category: "女性パワーで未来を変えるの部"}).paginate(page: params[:page],per_page: 10)
      @category = "女性パワーで未来を変えるの部"
      @category_count = current_voter.favorites.where(category: "女性パワーで未来を変えるの部").count
    elsif params[:name] == "ジェンダー・多様性の部"
      @posts = User.eager_load(:posts).where(posts: {category: "ジェンダー・多様性の部"}).paginate(page: params[:page],per_page: 10)
      @category = "ジェンダー・多様性の部"
      @category_count =  current_voter.favorites.where(category: "ジェンダー・多様性の部").count
    elsif params[:name] == "はたらく女子の部"
      @posts = User.eager_load(:posts).where(posts: {category: "はたらく女子の部"}).paginate(page: params[:page],per_page: 10)
      @category = "はたらく女子の部"
      @category_count = current_voter.favorites.where(category: "はたらく女子の部").count
    elsif params[:name] == "ママ・子どもの部"
      @posts = User.eager_load(:posts).where(posts: {category: "ママ・子どもの部"}).paginate(page: params[:page],per_page: 10)
      @category = "ママ・子どもの部"
      @category_count = current_voter.favorites.where(category: "ママ・子どもの部").count
    elsif params[:name] == "名もなき家事の部"
      @posts = User.eager_load(:posts).where(posts: {category: "名もなき家事の部"}).paginate(page: params[:page],per_page: 10)
      @category = "名もなき家事の部"
      @category_count = current_voter.favorites.where(category: "名もなき家事の部").count
    elsif params[:name] == "本当にありがとう❣️感謝の部"
      @posts = User.eager_load(:posts).where(posts: {category: "本当にありがとう❣️感謝の部"}).paginate(page: params[:page],per_page: 10)
      @category = "本当にありがとう❣️感謝の部"
      @category_count = current_voter.favorites.where(category: "本当にありがとう❣️感謝の部").count
    elsif params[:name] == "あるある❣️の部"
      @posts = User.eager_load(:posts).where(posts: {category: "あるある❣️の部"}).paginate(page: params[:page],per_page: 10)
      @category = "あるある❣️の部"
      @category_count = current_voter.favorites.where(category: "あるある❣️の部").count
    elsif params[:name] == "涙がポロ❣️の部"
      @posts = User.eager_load(:posts).where(posts: {category: "涙がポロ❣️の部"}).paginate(page: params[:page],per_page: 10)
      @category = "涙がポロ❣️の部"
      @category_count = current_voter.favorites.where(category: "涙がポロ❣️の部").count
    elsif params[:name] == "輝け❣️私のライフスタイルの部"
      @posts = User.eager_load(:posts).where(posts: {category: "輝け❣️私のライフスタイルの部"}).paginate(page: params[:page],per_page: 10)
      @category = "輝け❣️私のライフスタイルの部"
      @category_count = current_voter.favorites.where(category: "輝け❣️私のライフスタイルの部").count
    elsif params[:name] == "心がきゅん❣️私の癒しの部"
      @posts = User.eager_load(:posts).where(posts: {category: "心がきゅん❣️私の癒しの部"}).paginate(page: params[:page],per_page: 10)
      @category = "心がきゅん❣️私の癒しの部"
      @category_count = current_voter.favorites.where(category: "心がきゅん❣️私の癒しの部").count
    elsif params[:name] == "SDGsアクションの部"
      @posts = User.eager_load(:posts).where(posts: {category: "SDGsアクションの部"}).paginate(page: params[:page],per_page: 10)
      @category = "SDGsアクションの部"
      @category_count = current_voter.favorites.where(category: "SDGsアクションの部").count
    end
  end
  
  # 確認画面
  def edit
    if params[:format] == "女性パワーで未来を変えるの部"
      @check = current_voter.favorites.where(category: "女性パワーで未来を変えるの部")
      @category = "女性パワーで未来を変えるの部" 
    elsif params[:format] == "ジェンダー・多様性の部"
      @check = current_voter.favorites.where(category: "ジェンダー・多様性の部")
      @category = "ジェンダー・多様性の部"
    elsif params[:format] == "はたらく女子の部"
      @check = current_voter.favorites.where(category: "はたらく女子の部")
      @category = "はたらく女子の部"
    elsif params[:format] == "ママ・子どもの部"
      @check = current_voter.favorites.where(category: "ママ・子どもの部")
      @category = "ママ・子どもの部"
    elsif params[:format] == "名もなき家事の部"
      @check = current_voter.favorites.where(category: "名もなき家事の部")
      @category = "名もなき家事の部"
    elsif params[:format] == "本当にありがとう❣️感謝の部"
      @check = current_voter.favorites.where(category: "本当にありがとう❣️感謝の部")
      @category = "本当にありがとう❣️感謝の部"
    elsif params[:format] == "あるある❣️の部"
      @check = current_voter.favorites.where(category: "あるある❣️の部")
      @category = "あるある❣️の部"
    elsif params[:format] == "涙がポロ❣️の部"
      @check = current_voter.favorites.where(category: "涙がポロ❣️の部")
      @category = "涙がポロ❣️の部"
    elsif params[:format] == "輝け❣️私のライフスタイルの部"
      @check = current_voter.favorites.where(category: "輝け❣️私のライフスタイルの部")
      @category = "輝け❣️私のライフスタイルの部"
    elsif params[:format] == "心がきゅん❣️私の癒しの部"
      @check = current_voter.favorites.where(category: "心がきゅん❣️私の癒しの部")
      @category = "心がきゅん❣️私の癒しの部"
    elsif params[:format] == "SDGsアクションの部"
      @check = current_voter.favorites.where(category: "SDGsアクションの部")
      @category = "SDGsアクションの部"
    end
  end
  
  def update
    @voter = Voter.find(params[:id])
    @voterpost = @voter.voterposts.find_by(voter_id: params[:voter_id])
    if params[:back]
      if params[:format] == "女性パワーで未来を変えるの部"
        redirect_to voterpost_path(name: "女性パワーで未来を変えるの部")
      elsif params[:format] == "ジェンダー・多様性の部"
        redirect_to voterpost_path(name: "ジェンダー・多様性の部")
      elsif params[:format] == "はたらく女子の部"
        redirect_to voterpost_path(name: "はたらく女子の部")
      elsif params[:format] == "ママ・子どもの部"
        redirect_to voterpost_path(name: "ママ・子どもの部")
      elsif params[:format] == "名もなき家事の部"
        redirect_to voterpost_path(name: "名もなき家事の部")
      elsif params[:format] == "本当にありがとう❣️感謝の部"
        redirect_to voterpost_path(name: "本当にありがとう❣️感謝の部")
      elsif params[:format] == "あるある❣️の部"
        redirect_to voterpost_path(name: "あるある❣️の部")
      elsif params[:format] == "涙がポロ❣️の部"
        redirect_to voterpost_path(name: "涙がポロ❣️の部")
      elsif params[:format] == "輝け❣️私のライフスタイルの部"
        redirect_to voterpost_path(name: "輝け❣️私のライフスタイルの部")
      elsif params[:format] == "心がきゅん❣️私の癒しの部"
        redirect_to voterpost_path(name: "心がきゅん❣️私の癒しの部")
      elsif params[:format] == "SDGsアクションの部"
        redirect_to voterpost_path(name: "SDGsアクションの部")
      end       
    elsif params[:format] == "女性パワーで未来を変えるの部"
      if params[:favorite_post1] == ""
        flash[:danger] = "No.1を入力してください。"
        redirect_to edit_voterpost_path(current_voter, format: "女性パワーで未来を変えるの部")
      else
        @voter.voterposts.update(voterpost_params1)
        flash[:success] = '投票ありがとうございました。'
        redirect_to voterposts_path
      end
    elsif params[:format] == "ジェンダー・多様性の部"
      if params[:favorite_post2] == ""
        flash[:danger] = "No.1を入力してください。"
        redirect_to edit_voterpost_path(current_voter, format: "ジェンダー・多様性の部")
      else
        @voter.voterposts.update(voterpost_params2)
        flash[:success] = '投票ありがとうございました。'
        redirect_to voterposts_path
      end
    elsif params[:format] == "はたらく女子の部"
      if params[:favorite_post3] == ""
        flash[:danger] = "No.1を入力してください。"
        redirect_to edit_voterpost_path(current_voter, format: "はたらく女子の部")
      else
        @voter.voterposts.update(voterpost_params3)
        flash[:success] = '投票ありがとうございました。'
        redirect_to voterposts_path
      end
    elsif params[:format] == "ママ・子どもの部"
      if params[:favorite_post4] == ""
        flash[:danger] = "No.1を入力してください。"
        redirect_to edit_voterpost_path(current_voter, format: "ママ・子どもの部")
      else
        @voter.voterposts.update(voterpost_params4)
        flash[:success] = '投票ありがとうございました。'
        redirect_to voterposts_path
      end
    elsif params[:format] == "名もなき家事の部"
      if params[:favorite_post5] == ""
        flash[:danger] = "No.1を入力してください。"
        redirect_to edit_voterpost_path(current_voter, format: "名もなき家事の部")
      else      
        @voter.voterposts.update(voterpost_params5)
        flash[:success] = '投票ありがとうございました。'
        redirect_to voterposts_path
      end
    elsif params[:format] == "本当にありがとう❣️感謝の部"
      if params[:favorite_post6] == ""
        flash[:danger] = "No.1を入力してください。"
        redirect_to edit_voterpost_path(current_voter, format: "本当にありがとう❣️感謝の部")
      else
        @voter.voterposts.update(voterpost_params6)
        flash[:success] = '投票ありがとうございました。'
        redirect_to voterposts_path
      end
    elsif params[:format] == "あるある❣️の部"
      if params[:favorite_post7] == ""
        flash[:danger] = "No.1を入力してください。"
        redirect_to edit_voterpost_path(current_voter, format: "あるある❣️の部")
      else
        @voter.voterposts.update(voterpost_params7)
        flash[:success] = '投票ありがとうございました。'
        redirect_to voterposts_path
      end
    elsif params[:format] == "涙がポロ❣️の部"
      if params[:favorite_post8] == ""
        flash[:danger] = "No.1を入力してください。"
        redirect_to edit_voterpost_path(current_voter, format: "涙がポロ❣️の部")
      else
        @voter.voterposts.update(voterpost_params8)
        flash[:success] = '投票ありがとうございました。'
        redirect_to voterposts_path
      end
    elsif params[:format] == "輝け❣️私のライフスタイルの部"
      if params[:favorite_post9] == ""
        flash[:danger] = "No.1を入力してください。"
        redirect_to edit_voterpost_path(current_voter, format: "輝け❣️私のライフスタイルの部")
      else
        @voter.voterposts.update(voterpost_params9)
        flash[:success] = '投票ありがとうございました。'
        redirect_to voterposts_path
      end
    elsif params[:format] == "心がきゅん❣️私の癒しの部"
      if params[:favorite_post10] == ""
        flash[:danger] = "No.1を入力してください。"
        redirect_to edit_voterpost_path(current_voter, format: "心がきゅん❣️私の癒しの部")
      else
        @voter.voterposts.update(voterpost_params10)
        flash[:success] = '投票ありがとうございました。'
        redirect_to voterposts_path
      end
    elsif params[:format] == "SDGsアクションの部"
      if params[:favorite_post11] == ""
        flash[:danger] = "No.1を入力してください。"
        redirect_to edit_voterpost_path(current_voter, format: "SDGsアクションの部")
      else
        @voter.voterposts.update(voterpost_params11)
        flash[:success] = '投票ありがとうございました。'
        redirect_to voterposts_path
      end
    else
      flash[:danger] = "投票に失敗しました。" 
      redirect_to voterposts_path
    end
  end

  private

    def voterpost_params1
      params.permit(:favorite_post1, :reason1).merge(voter_id: current_voter.id)
      # params.require(:voterpost).permit(:favorite_post, :reason).merge(voter_id: current_voter.id)
    end
    def voterpost_params2
      params.permit(:favorite_post2, :reason2).merge(voter_id: current_voter.id)
    end
    def voterpost_params3
      params.permit(:favorite_post3, :reason3).merge(voter_id: current_voter.id)
    end
    def voterpost_params4
      params.permit(:favorite_post4, :reason4).merge(voter_id: current_voter.id)
    end
    def voterpost_params5
      params.permit(:favorite_post5, :reason5).merge(voter_id: current_voter.id)
    end
    def voterpost_params6
      params.permit(:favorite_post6, :reason6).merge(voter_id: current_voter.id)
    end
    def voterpost_params7
      params.permit(:favorite_post7, :reason7).merge(voter_id: current_voter.id)
    end
    def voterpost_params8
      params.permit(:favorite_post8, :reason8).merge(voter_id: current_voter.id)
    end
    def voterpost_params9
      params.permit(:favorite_post9, :reason9).merge(voter_id: current_voter.id)
    end
    def voterpost_params10
      params.permit(:favorite_post10, :reason10).merge(voter_id: current_voter.id)
    end
    def voterpost_params11
      params.permit(:favorite_post11, :reason11).merge(voter_id: current_voter.id)
    end

end 


