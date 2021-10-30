require 'csv'

class Staffs::StaffsController < ApplicationController
  before_action :staff_only, only: [:toppage, :index]
  # before_action :correct_staff

  def toppage
  end

  def index
    @users = User.eager_load(:posts).all
    @posts = Post.all.where.not(first_phrase: "")
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_posts_csv(@posts)
      end
    end
  end

  def send_posts_csv(posts)
    if current_staff.admin == true
      csv_data = CSV.generate do |csv|
        header = %w(上の句 中の句 下の句 ペンネーム 部門 氏名 Email 性別 お住まい 職業 年代 メッセージ アンケート 投票数)
        csv << header

        posts.each do |post|
          user = User.find_by(id: post.user_id)
          values = [post.first_phrase, post.second_phrase, post.third_phrase, post.pen_name, post.category,
                    user.name, user.email, user.gender, user.address, user.profession, user.age, user.note, user.questionary]
          csv << values
        end
      end
    else
      csv_data = CSV.generate do |csv|
        header = %w(上の句 中の句 下の句 ペンネーム 部門 性別 お住まい 職業 年代 メッセージ アンケート 投票数)
        csv << header

        posts.each do |post|
          user = User.find_by(id: post.user_id)
          values = [post.first_phrase, post.second_phrase, post.third_phrase, post.pen_name, post.category,
                    user.gender, user.address, user.profession, user.age, user.note, user.questionary]
          csv << values
        end
      end
    end
    send_data(csv_data, filename: "jokatsu_senryu.csv")
  end

  def users_index
    @search_params = user_search_params
    @users = User.search(@search_params).paginate(page: params[:page])
  end

  def users_show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  private

    def user_search_params
      params.fetch(:search, {}).permit(:name)
    end

end
