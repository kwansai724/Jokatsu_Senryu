class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 投票者画面閲覧制限
  def voter_only
    unless current_voter.present?
      flash[:danger] = "投票者しか閲覧出来ません。"
      redirect_back(fallback_location: root_url)
    end
  end

  # 各投票者の画面閲覧制限
  def correct_voter
    if current_voter.present?
      unless current_voter.id == params[:format].to_i
        flash[:danger] = "閲覧出来ません。"
        redirect_back(fallback_location: posts_url(format: current_voter.id))
      end
    end
  end
  
  # スタッフ画面閲覧制限
  def staff_only
    unless current_staff.present?
      flash[:danger] = "管理者・スタッフしか閲覧出来ません。"
      redirect_back(fallback_location: root_url)
    end
  end

  # 各企業の画面閲覧制限
  def correct_staff
    if current_staff.admin == false
      unless current_staff.id == params[:format].to_i || current_staff.group_name == params[:group_name]
        flash[:danger] = "閲覧出来ません。"
        redirect_back(fallback_location: staffs_staffs_toppage_url(format: current_staff.id))
      end
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :group, :password, :password_confirmation]) 
    devise_parameter_sanitizer.permit(:sign_in, keys:[:name, :group, :password, :password_confirmation]) 
  end

end
