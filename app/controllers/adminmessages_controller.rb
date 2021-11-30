class AdminmessagesController < ApplicationController
  def index
    @message = Adminmessage.new
    @messages = Adminmessage.all
  end
  
  def create
    @message = Adminmessage.new(message_params)
    if @message.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to adminmessages_path(id: current_staff.id)
    else
      render :index
      flash[:success] = '新規作成に失敗しました。'
    end
  end

  def edit
    @message = Adminmessage.find(params[:id])
  end

  def update
    @message = Adminmessage.find(params[:id])
    if @message.update_attributes(message_update_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to adminmessages_path(id: current_staff.id)
    else
      render :index
    end
  end

  def destroy
    @message = Adminmessage.find(params[:id])
    @message.destroy
    flash[:success] = "データを削除しました。"
    redirect_to adminmessages_path(id: current_staff.id)
  end

  private
  
  def message_params
    params.permit(:message, :staff_id)
  end
  
  def message_update_params
    params.require(:adminmessage).permit(:message, :staff_id)
  end
end
