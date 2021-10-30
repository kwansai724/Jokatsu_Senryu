class PostsController < ApplicationController
  before_action :voter_only, only: [:index]
  before_action :correct_voter


  def index
    @posts = User.eager_load(:posts).all
  end
end
