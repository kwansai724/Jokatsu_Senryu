class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :allow_iframe
  protect_from_forgery with: :null_session

  # 投票者画面閲覧制限
  def voter_only
    return if current_voter.present?

    flash[:danger] = "投票者しか閲覧出来ません。"
    redirect_back(fallback_location: public_root_url)
  end

  # 各投票者の画面閲覧制限
  def correct_voter
    return unless current_voter.present? && params[:format].present?

    return if current_voter.id == params[:format].to_i

    flash[:danger] = "閲覧出来ません。"
    redirect_back(fallback_location: voterposts_url(format: current_voter.id))
  end

  # スタッフ画面閲覧制限
  def staff_only
    return if current_staff.present?

    flash[:danger] = "管理者・スタッフしか閲覧出来ません。"
    redirect_back(fallback_location: public_root_url)
  end

  # 各企業の画面閲覧制限
  def correct_staff
    if current_staff.present? && current_staff.admin == false && params[:format] != "csv"
      unless current_staff.id == params[:format].to_i || current_staff.group_name == params[:group_name]
        flash[:danger] = "閲覧出来ません。"
        redirect_back(fallback_location: staffs_staffs_toppage_url(format: current_staff.id))
      end
    elsif current_staff.nil?
      flash[:danger] = "閲覧出来ません。"
      redirect_back(fallback_location: public_root_url)
    end
  end

  # voterpostのupdateで登録するためにvoter_idを最初に登録
  def voter_id
    @voter = Voter.find(current_voter.id)
    if @voter.voterposts.present? == false
      @voterpost = @voter.voterposts.create!(voter_id: current_voter.id)
    else
      @voter.voterposts.each do |v|
        @voterpost = @voter.voterposts.create!(voter_id: current_voter.id) if current_voter.id != v.voter_id
      end
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :group, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :group, :password, :password_confirmation])
  end

  def allow_iframe
    response.headers['X-Frame-Options'] = 'ALLOW-FROM https://www.sdgswip.com/pages/5514498/static'
    # response.headers['X-Frame-Options'] = 'ALLOWALL'
  end
end
