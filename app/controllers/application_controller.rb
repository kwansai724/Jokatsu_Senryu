class ApplicationController < ActionController::Base

  def admin_only
    unless current_voter.admin == true
      flash[:danger] = "管理者しか閲覧出来ません。"
      # redirect_to @voter
    end
  end
end
