class ApplicationController < ActionController::Base

  # 管理者画面閲覧制限
  def admin_only
    unless current_voter.present? && current_voter.admin == true
      flash[:danger] = "管理者しか閲覧出来ません。"
      redirect_back(fallback_location: "/voters/voters/index")
    end
  end

  # 投票者画面閲覧制限
  def voter_only
    unless current_voter.present? && current_voter.admin == false
      flash[:danger] = "投票者しか閲覧出来ません。"
      redirect_back(fallback_location: "/voters/voters/admin")
    end
  end

end
