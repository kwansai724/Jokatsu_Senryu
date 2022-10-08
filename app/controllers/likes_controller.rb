class LikesController < ApplicationController
  def create
    unless current_voter.favorites.include?(clicked_post)
      @user = User.find(@post.user_id)
      like = current_voter.likes.new(post_id: clicked_post.id)
      like.save
      if @post.category == "女性パワーで未来を変えるの部"
        @category_count = current_voter.favorites.where(category: "女性パワーで未来を変えるの部").count
        @category = "女性パワーで未来を変えるの部"
      elsif @post.category == "ジェンダー・多様性の部"
        @category_count = current_voter.favorites.where(category: "ジェンダー・多様性の部").count
        @category = "ジェンダー・多様性の部"
      elsif @post.category == "はたらく女子の部"
        @category_count = current_voter.favorites.where(category: "はたらく女子の部").count
        @category = "はたらく女子の部"
      elsif @post.category == "ママ・子どもの部"
        @category_count = current_voter.favorites.where(category: "ママ・子どもの部").count
        @category = "ママ・子どもの部"
      elsif @post.category == "名もなき家事の部"
        @category_count = current_voter.favorites.where(category: "名もなき家事の部").count
        @category = "名もなき家事の部"
      elsif @post.category == "本当にありがとう❣️感謝の部"
        @category_count = current_voter.favorites.where(category: "本当にありがとう❣️感謝の部").count
        @category = "本当にありがとう❣️感謝の部"
      elsif @post.category == "あるある❣️の部"
        @category_count = current_voter.favorites.where(category: "あるある❣️の部").count
        @category = "あるある❣️の部"
      elsif @post.category == "涙がポロ❣️の部"
        @category_count = current_voter.favorites.where(category: "涙がポロ❣️の部").count
        @category = "涙がポロ❣️の部"
      elsif @post.category == "輝け❣️私のライフスタイルの部"
        @category_count = current_voter.favorites.where(category: "輝け❣️私のライフスタイルの部").count
        @category = "輝け❣️私のライフスタイルの部"
      elsif @post.category == "心がきゅん❣️私の癒しの部"
        @category_count = current_voter.favorites.where(category: "心がきゅん❣️私の癒しの部").count
        @category = "心がきゅん❣️私の癒しの部"
      elsif @post.category == "SDGsアクションの部"
        @category_count = current_voter.favorites.where(category: "SDGsアクションの部").count
        @category = "SDGsアクションの部" 
      end
    end
  end

  def destroy
    
    @post = Post.find(params[:post_id])
    @user = User.find(@post.user_id)
    current_voter.likes.find_by(post_id: params[:post_id]).destroy
    if @post.category == "女性パワーで未来を変えるの部"
      @category_count = current_voter.favorites.where(category: "女性パワーで未来を変えるの部").count
      @category = "女性パワーで未来を変えるの部"
    elsif @post.category == "ジェンダー・多様性の部"
      @category_count = current_voter.favorites.where(category: "ジェンダー・多様性の部").count
      @category = "ジェンダー・多様性の部"
    elsif @post.category == "はたらく女子の部"
      @category_count = current_voter.favorites.where(category: "はたらく女子の部").count
      @category = "はたらく女子の部"
    elsif @post.category == "ママ・子どもの部"
      @category_count = current_voter.favorites.where(category: "ママ・子どもの部").count
      @category = "ママ・子どもの部"
    elsif @post.category == "名もなき家事の部"
      @category_count = current_voter.favorites.where(category: "名もなき家事の部").count
      @category = "名もなき家事の部"
    elsif @post.category == "本当にありがとう❣️感謝の部"
      @category_count = current_voter.favorites.where(category: "本当にありがとう❣️感謝の部").count
      @category = "本当にありがとう❣️感謝の部"
    elsif @post.category == "あるある❣️の部"
      @category_count = current_voter.favorites.where(category: "あるある❣️の部").count
      @category = "あるある❣️の部"
    elsif @post.category == "涙がポロ❣️の部"
      @category_count = current_voter.favorites.where(category: "涙がポロ❣️の部").count
      @category = "涙がポロ❣️の部"
    elsif @post.category == "輝け❣️私のライフスタイルの部"
      @category_count = current_voter.favorites.where(category: "輝け❣️私のライフスタイルの部").count
      @category = "輝け❣️私のライフスタイルの部"
    elsif @post.category == "心がきゅん❣️私の癒しの部"
      @category_count = current_voter.favorites.where(category: "心がきゅん❣️私の癒しの部").count
      @category = "心がきゅん❣️私の癒しの部"
    elsif @post.category == "SDGsアクションの部"
      @category_count = current_voter.favorites.where(category: "SDGsアクションの部").count
      @category = "SDGsアクションの部"
    end
  end

  private

    def clicked_post
      @post = Post.find(params[:post_id])
    end

end
