class Voters::VotersController < ApplicationController
  before_action :authenticate_voter!
  before_action :admin_only, only: [:admin]

  def index
    @voter = current_voter
  end

  def admin
    @voter = current_voter
  end

end
