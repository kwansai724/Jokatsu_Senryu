require 'csv'

class Staffs::StaffsController < ApplicationController
  before_action :staff_only
  before_action :correct_staff
  before_action :detect_device, only: [:voterposts_show]

  def toppage
  end

  def index
    # allでランキング
    # @post_like = Post.find(Like.group(:post_id).order(Arel.sql('count(post_id) desc')).pluck(:post_id) )
    # カテゴリー別に表示
    # @post_rank = @post_like.select{|post| post.category == params[:category_name] }

    # 投票者別ランキング
    @post_like = Post.find(Like.where(voter_id: Voter.where(group: params[:group_name]).ids).group(:post_id).order(Arel.sql('count(post_id) desc')).pluck(:post_id) )
    # カテゴリー別に表示
    @post_rank = @post_like.select{|post| post.category == params[:category_name] }.paginate(page: params[:page],per_page: 100)
    
    @posts_index = Post.eager_load(:user).where(category: params[:category_name]).paginate(page: params[:page],per_page: 100)
    # @posts_index = Post.eager_load(:likes).where(category: params[:category_name], likes: {voter_id: Voter.where(group: params[:group_name]).ids})
    #                 .order('count(voter_id) desc').group('posts.id').paginate(page: params[:page],per_page: 100)
    # @posts_index = Post.eager_load(:likes).where(category: params[:category_name], likes: {voter_id: Voter.where(group: params[:group_name]).ids})
    #                   .order('count(likes.id) desc').group(:id).paginate(page: params[:page],per_page: 100)
    @staffs = Staff.where(admin: false)
    @staff = Staff.find_by(group_name: params[:group_name])
    @users = User.eager_load(:posts).all
    @posts = Post.all.where.not(first_phrase: "")
    if params[:key] == "posts"
      respond_to do |format|
        format.html
        format.csv do |csv|
          send_posts_csv(@posts)
        end
      end
    elsif params[:key] == "users" 
      respond_to do |format|
        format.html
        format.csv do |csv|
          send_users_csv(@users)
        end
      end
    end
  end

  def send_posts_csv(posts)
    if current_staff.admin == true
      csv_data = CSV.generate do |csv|
        header = %w(No 上の句 中の句 下の句 ペンネーム 部門 氏名 Email 性別 お住まい 職業 年代 メッセージ アンケート 得票数（WIP） 得票数（全体）)
        csv << header

        posts.each do |post|
          user = User.find_by(id: post.user_id)
          values = [post.id, post.first_phrase, post.second_phrase, post.third_phrase, post.pen_name, post.category,
                    user.name, user.email, user.gender, user.address, user.profession, user.age, user.note, user.questionary,
                    Like.where(post_id: post.id).where(voter_id: Voter.where(group: params[:group_name]).ids).count,
                    Like.where(post_id: post.id).count]
          csv << values
        end
      end
    else
      csv_data = CSV.generate do |csv|
        header = %w(No 上の句 中の句 下の句 ペンネーム 部門 性別 お住まい 職業 年代 メッセージ アンケート 得票数)
        csv << header

        posts.each do |post|
          user = User.find_by(id: post.user_id)
          values = [post.id, post.first_phrase, post.second_phrase, post.third_phrase, post.pen_name, post.category,
                    user.gender, user.address, user.profession, user.age, user.note, user.questionary,
                    Like.where(post_id: post.id).where(voter_id: Voter.where(group: params[:group_name]).ids).count]
          csv << values
        end
      end
    end
    send_data(csv_data, filename: "jokatsu_senryu.csv")
  end

  def send_users_csv(users)
    csv_data = CSV.generate do |csv|
      header = %w(No 氏名 Email 性別 お住まい 職業 （職業：その他） 年代 メッセージ アンケート)
      csv << header

      users.each do |user|
        values = [user.id, user.name, user.email, user.gender, user.address, user.profession, user.other, user.age, user.note, user.questionary]
        csv << values
      end
    end
    send_data(csv_data, filename: "jokatsu_senryu_users.csv")
  end
  

  def users_index
    @search_params = user_search_params
    @users = User.search(@search_params).paginate(page: params[:page],per_page: 50)
  end

  def users_show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  def voterposts_index
    @voters_admin = Voter.all.order(:group)
    @voters = Voter.where(group: current_staff.group_name)
  end

  def voterposts_show
    @voter = Voter.find(params[:id])
    @voterpost = Voterpost.find_by(voter_id: @voter.id)
  end

  def import
    if params[:file].blank?
      flash[:danger] = "csvファイルが選択されていません。"
      redirect_to staffs_staffs_voterposts_index_url
    else
      #fileはtmpに自動で一時保存される
      Staff.import(params[:file])
      flash[:success] = "CSVファイルをインポートしました。"
      redirect_to staffs_staffs_voterposts_index_url
    end
  end

  def group_index
    @staffs = Staff.all
    @group_members = Voter.all
  end


  private

    def user_search_params
      params.fetch(:search, {}).permit(:name)
    end

    def detect_device
      case request.user_agent
        when /iPhone/
            request.variant = :mobile
        when /Android/
            request.variant = :mobile
      end
    end


end
