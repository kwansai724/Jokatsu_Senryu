class UsersController < ApplicationController
  before_action :questionary_string, only: [:confirm]
  # before_action :allow_iframe
  
  def index
    @user = User.new
    2.times {@user.posts.build} 
  end

  # 確認画面
  def confirm
    # byebug
    @user = User.new(user_params)
    # byebug
    if @user.invalid?(:category_valid)
      flash.now[:danger] = @user.errors.full_messages.join("<br>")
      render :index
      # redirect_to users_path
    end    
  end

  def create
    @user = User.new(user_params)
    # byebug
    if params[:back] 
      render :index    
    elsif @user.save
      PostedMailer.send_mail(@user).deliver_now #メール送信
      # flash[:success] = '投稿ありがとうございました。'
      redirect_to thanks_users_path 
    else
      flash[:danger] = "投稿に失敗しました。<br>" + @user.errors.full_messages.join("<br>")
      redirect_to users_path 
    end
    
  end

  def thanks
  end

  private
  
    def user_params
      params.require(:user).permit(:name, :email, :gender, :address, :profession, :age, :note, :other, :questionary, posts_attributes:[:first_phrase, :second_phrase, :third_phrase, :pen_name, :category, :id])
    end

    def questionary_string
      if params[:user][:questionary] != nil 
        params[:user][:questionary] = params[:user][:questionary].join("/")
      end 
    end


end
