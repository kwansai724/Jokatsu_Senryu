class PostsController < ApplicationController
  before_action :voter_only, only: [:index]
  before_action :correct_voter

  def index
  end
end
