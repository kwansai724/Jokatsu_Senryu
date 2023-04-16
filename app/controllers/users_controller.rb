class UsersController < ApplicationController
  before_action :questionary_string, only: [:confirm]
  # before_action :allow_iframe

  def index
    @user = User.new
    2.times { @user.posts.build }
  end

  # 確認画面
  def confirm
    @user = User.new(user_params)
    return unless @user.invalid?(:category_valid)

    flash.now[:danger] = @user.errors.full_messages.join("<br>")
    render :index
  end

  def create
    @user = User.new(user_params)
    @messages = Adminmessage.all
    if params[:back]
      render :index
    elsif @user.save
      PostedMailer.send_mail(@user, @messages).deliver_now # メール送信
      redirect_to thanks_users_path
    else
      flash[:danger] = "投稿に失敗しました。<br> #{@user.errors.full_messages.join('<br>')}"
      redirect_to users_path
    end
  end

  def thanks
  end

  private

  def user_params
    # ２つ目の川柳が空の場合、パラメータから削除して保存しないようにする
    if params["action"] == "create" && params["user"]["posts_attributes"]["1"]["category"].blank?
      params["user"]["posts_attributes"].delete("1")
    end

    params.require(:user).permit(
      :name, :email, :gender, :address, :profession, :age, :note, :other, :questionary,
      posts_attributes: [:first_phrase, :second_phrase, :third_phrase, :pen_name, :category, :id]
    )
  end

  def questionary_string
    params[:user][:questionary] = params[:user][:questionary].join("/") if params[:user][:questionary].present?
  end
end
