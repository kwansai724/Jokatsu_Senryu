class UsersController < ApplicationController
  def index
    @user = User.new
    5.times {@user.posts.build}
  end

  # 確認画面
  def confirm
    # byebug
    @user = User.new(user_params)
    if @user.invalid?
      flash[:danger] = @user.errors.full_messages.join("<br>")
      redirect_to users_path
    end
  end

  def create
    @user = User.new(user_params)
      if params[:back]
        render :index 
      elsif @user.save
        PostedMailer.send_mail(@user).deliver_now #メール送信
        flash[:success] = '投稿に成功しました。'
        redirect_to users_path
      else
        flash[:danger] = "投稿は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
        redirect_to users_path
    end
  end

  private
  
    def user_params
      params.require(:user).permit(:name, :email, :gender, :address, :profession, :age, :note, :questionary, :other, posts_attributes:[:first_phrase, :second_phrase, :third_phrase, :pen_name, :category, :id])
    end
end
