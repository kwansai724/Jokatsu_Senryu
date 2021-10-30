class Staffs::StaffsController < ApplicationController
  before_action :staff_only, only: [:toppage, :index]
  before_action :correct_staff

  def toppage
  end

  def index
    @posts = User.eager_load(:posts).all
  end
end
