class Voters::VotersController < ApplicationController
  before_action :authenticate_voter!
  before_action :admin_only, only: [:admin]
  before_action :voter_only, only: [:index]

  def index
    @voter = current_voter
  end

  def admin
    @voter = current_voter
  end

end
