class UsersController < ApplicationController
  def index
    @user = User.new
    5.times {@user.posts.build}
  end

  def new
  end

  # 確認画面
  def confilrm
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)
      if params[:back]
        redirect_to users_index_path
      elsif @user.save
        flash[:success] = '投稿に成功しました。'
        redirect_to users_index_path
      else
        flash[:danger] = "登録は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
        redirect_to users_index_path
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :gender, :address, :profession, :age, :note, :questionary, posts_attributes:[:first_phrase, :second_phrase, :third_phrase, :pen_name, :category, :id])
  end
end
