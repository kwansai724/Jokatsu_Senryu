class Voters::VotersController < ApplicationController
  before_action :authenticate_voter!
  before_action :admin_only, only: [:admin, :users_index]
  before_action :voter_only, only: [:index]

  def index
    @voter = current_voter
  end

  def admin
    @voter = current_voter
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
