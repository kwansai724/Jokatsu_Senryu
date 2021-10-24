class PostsController < ApplicationController
  before_action :voter_only, only: [:index]

  def index
    # @posts = User.eager_load(:posts)
    # @favorite_posts = User.eager_load(:posts)
  end
end
