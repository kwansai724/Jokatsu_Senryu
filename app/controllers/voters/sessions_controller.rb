# frozen_string_literal: true

class Voters::SessionsController < Devise::SessionsController
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

    #emailだけでログインできるように変更
    
    if params[:voter]['email'].present?
      self.resource = Voter.where(:email => params[:voter]['email']).first
      if self.resource.present?
        set_flash_message(:notice, :signed_in) if is_flashing_format?
        sign_in(resource_name, resource)
        yield resource if block_given?
        respond_with resource, :location => after_sign_in_path_for(resource)
      else
        flash[:danger] = "Eメールが違います"
        redirect_to root_path
      end
    end
  end


  # ログイン後の画面遷移
  def after_sign_in_path_for(resource)
    if current_voter.admin == true
      voters_voters_admin_path(resource)
    else
      voters_voters_index_path(resource)
    end
  end

  # ログアウト後の画面遷移
  def after_sign_out_path_for(resource)
    new_voter_session_path
  end
  
end
