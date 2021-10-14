class Voters::VotersController < ApplicationController
  before_action :authenticate_voter!

  def index
    @voter = current_voter
  end

  def admin
    @voter = current_voter
  end

end
