class Staffs::StaffsController < ApplicationController

  def toppage
  end

  def index
    @posts = User.eager_load(:posts).all
  end
end
