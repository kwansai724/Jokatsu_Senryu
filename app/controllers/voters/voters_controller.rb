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
    # @users = User.search(@search_params).page(params[:page]).per(10)
  end

  private

    def user_search_params
      params.fetch(:search, {}).permit(:name)
    end
    
end
