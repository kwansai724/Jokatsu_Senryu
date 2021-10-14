class Voters::VotersController < ApplicationController
  before_action :authenticate_voter!

  def index
    @voter = current_voter
  end
end
