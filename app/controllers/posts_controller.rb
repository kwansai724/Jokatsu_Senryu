class PostsController < ApplicationController
  def index
    @posts = User.eager_load(:posts).all
  end

end
