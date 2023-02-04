# frozen_string_literal: true

class Staffs::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def create
    #元の認証ロジック
    #self.resource = warden.authenticate!(auth_options)

    #login_idだけでログインできるように変更
    
    if params[:staff]['login_id'].present?
      self.resource = Staff.where(:login_id => params[:staff]['login_id']).first
      if self.resource.present?
        set_flash_message(:notice, :signed_in) if is_flashing_format?
        sign_in(resource_name, resource)
        yield resource if block_given?
        if self.resource.admin == false
          session[:admin] = "false"
          respond_with resource, :location => after_sign_in_path_for(resource)
        elsif self.resource.admin == true
          session[:admin] = "true"
          respond_with resource, :location => after_sign_in_path_for(resource)
        end
      else
        flash[:danger] = "登録された名前が違います"
        redirect_to root_path
      end
    end
  end

  # ログイン後の画面遷移
  def after_sign_in_path_for(resource)
    staffs_staffs_toppage_path(resource)
    # if current_staff.admin == true
    #   staffs_staffs_toppage_path(resource)
    # else
    #   staffs_staffs_index_path(resource)
    # end
  end

  # ログアウト後の画面遷移
  def after_sign_out_path_for(resource)
    new_staff_session_path
  end

end
