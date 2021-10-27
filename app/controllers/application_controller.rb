class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

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

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :group, :password, :password_confirmation]) 
    devise_parameter_sanitizer.permit(:sign_in, keys:[:name, :group, :password, :password_confirmation]) 
  end

end
