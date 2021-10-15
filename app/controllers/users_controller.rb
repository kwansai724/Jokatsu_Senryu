class UsersController < ApplicationController
  def index
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
    params.permit(:name, :email, :gender, :address, :profession, :age, :note, :questionary)
  end
end
