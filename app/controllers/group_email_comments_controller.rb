class GroupEmailCommentsController < ApplicationController
  before_action :group_email_create, only: [:index]

  def index
    @staff = Staff.find(params[:id])
    @group_email_comments = @staff.group_email_comments.all
    @group_email_comment = @staff.group_email_comments.find_by(staff_id: params[:id])
  end

  def edit
    @group_email_comment = GroupEmailComment.find(params[:id])
  end

  def update
    @group_email_comment = GroupEmailComment.find(params[:id])
    if @group_email_comment.update_attributes(group_email_comment_params)
      flash[:success] = "更新しました。"
      redirect_to group_email_comments_path(id: current_staff.id)
    else
      render :index
    end
  end

  # def destroy
  #   @group_email_comment = GroupEmailComment.find(params[:id])
  #   @group_email_comment.destroy
  #   flash[:success] = "データを削除しました。"
  #   redirect_to group_email_comments_path(id: current_staff.id)
  # end

  def group_email
    @group_email_comment = GroupEmailComment.find_by(staff_id: params[:id])
    @group_email_comments = GroupEmailComment.all
    GroupMailer.send_announcement_mail(@group_email_comment.subject, @group_email_comment.comment, User.all.pluck(:email)).deliver_now
    flash[:success] = 'メールを一斉送信しました。'
    redirect_to group_email_comments_path(id: current_staff.id)
  end

  private

  def group_email_comment_params
    params.require(:group_email_comment).permit(:subject, :comment, :staff_id)
  end

  def group_email_create
    @staff = Staff.find(params[:id])
    @group_email_comments = @staff.group_email_comments.all
    @group_email_comment = @staff.group_email_comments.find_by(staff_id: params[:id])
    unless @group_email_comments.present?
      @group_email_comment = @staff.group_email_comments.create!(subject: "題test", comment: "テスト内容", staff_id: current_staff.id)
    end
  end
end
