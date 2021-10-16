class PostsController < ApplicationController
  def index
    @posts = User.eager_load(:posts).all
  end

  def new
  end

  def create
  end
end
