class Staffs::StaffsController < ApplicationController
  before_action :staff_only, only: [:toppage, :index]
  before_action :correct_staff

  def toppage
  end

  def index
    @posts = User.eager_load(:posts).all
  end

  def users_index
    @search_params = user_search_params
    @users = User.search(@search_params).paginate(page: params[:page])
  end

  def users_show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  private

    def user_search_params
      params.fetch(:search, {}).permit(:name)
    end

end
