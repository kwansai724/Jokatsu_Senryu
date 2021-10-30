class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 投票者画面閲覧制限
  def voter_only
    unless current_voter.present?
      flash[:danger] = "投票者しか閲覧出来ません。"
      redirect_back(fallback_location: root_url)
    end
  end

  # スタッフ画面閲覧制限
  def staff_only
    unless current_staff.present?
      flash[:danger] = "管理者・スタッフしか閲覧出来ません。"
      redirect_back(fallback_location: root_url)
    end
  end

  # def correct_voter
  #   @voter = current_voter
  #   redirect_to(root_url)  unless current_voter.id == params[:format]
  # end

  


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :group, :password, :password_confirmation]) 
    devise_parameter_sanitizer.permit(:sign_in, keys:[:name, :group, :password, :password_confirmation]) 
  end

end
