class UsersController < ApplicationController
  def index
    @user = User.new
    @user.posts.build
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = '投稿に成功しました。'
      redirect_to users_index_path
    else
      render :index
    end
  end

  private
  
  def user_params
    # params.require(:user).permit(:name, :email, :gender, :address, :profession, :age, :note, :questionary, posts_attributes:[:first_phrase, :second_phrase, :third_phrase, :pen_name, :category, :id])
    params.require(:user).permit(:name, :email, :gender, :address, :profession, :age, :note, :questionary, posts:[:first_phrase, :second_phrase, :third_phrase, :pen_name, :category, :id])
  end
end
