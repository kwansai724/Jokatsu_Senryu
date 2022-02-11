require 'csv'
require 'nkf'

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
    # @post_like = Post.find(Like.where(voter_id: Voter.where(group: params[:group_name]).ids).group(:post_id).order(Arel.sql('count(post_id) desc')).pluck(:post_id)).paginate(page: params[:page],per_page: 100)
    @post_like = Post.find(Like.where(voter_id: Voter.where(group: params[:group_name]).ids).group(:post_id).order(Arel.sql('count(post_id) desc')).pluck(:post_id))

    # カテゴリー別に表示
    @post_rank = @post_like.select{|post| post.category == params[:category_name] }.paginate(page: params[:page],per_page: 100)
    @posts_index = Post.eager_load(:user).where(category: params[:category_name]).paginate(page: params[:page],per_page: 100)
    @staffs = Staff.where(admin: false)
    @staff = Staff.find_by(group_name: params[:group_name])
    @users = User.eager_load(:posts).all
    @posts = Post.all.where.not(first_phrase: "")
    @voters = Voter.eager_load(:voterposts).all
    @voterposts = Voterpost.all.order(voter_id: "ASC")
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
    elsif params[:key] == "voters"
      respond_to do |format|
        format.html
        format.csv do |csv|
          send_voters_csv(@voterposts)
        end
      end
    end
  end

  def send_posts_csv(posts)
    if current_staff.admin == true
      bom = "\uFEFF"
      csv_data = CSV.generate(bom) do |csv|
        # header = %w(No 上の句 中の句 下の句 ペンネーム 部門 氏名 Email 性別 お住まい 職業 年代 メッセージ アンケート 得票数（WIP） 得票数（全体）)
        header = %w(No 上の句 中の句 下の句 ペンネーム 部門 氏名 性別 お住まい 職業 年代 メッセージ アンケート 得票数（WIP） 得票数（全体）)

        csv << header

        posts.each do |post|
          user = User.find_by(id: post.user_id)
          # values = [post.id, post.first_phrase, post.second_phrase, post.third_phrase, post.pen_name, post.category,
          #           user.name, user.email, user.gender, user.address, user.profession, user.age, user.note, user.questionary,
          #           Like.where(post_id: post.id).where(voter_id: Voter.where(group: params[:group_name]).ids).count,
          #           Like.where(post_id: post.id).count]
          values = [post.id, post.first_phrase, post.second_phrase, post.third_phrase, post.pen_name, post.category,
                    user.name, user.gender, user.address, user.profession, user.age, user.note, user.questionary,
                    Like.where(post_id: post.id).where(voter_id: Voter.where(group: params[:group_name]).ids).count,
                    Like.where(post_id: post.id).count]
  
          csv << values
        end
      end
    else
      bom = "\uFEFF"
      csv_data = CSV.generate(bom) do |csv|
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
    bom = "\uFEFF"
    csv_data = CSV.generate(bom) do |csv|
      header = %w(No 氏名 Email 性別 お住まい 職業 （職業：その他） 年代 メッセージ アンケート)
      csv << header

      users.each do |user|
        name = user.name.gsub(/[[:space:]]/, '').strip.tr('０-９ａ-ｚＡ-Ｚ','0-9a-zA-Z')
        name = NKF.nkf('-w -Z1', name)
        values = [user.id, name, user.email, user.gender, user.address, user.profession, user.other, user.age, user.note, user.questionary]
        csv << values
      end
    end
    send_data(csv_data, filename: "jokatsu_senryu_users.csv")
  end

  def send_voters_csv(voterposts)
    # if current_staff.admin == true
      bom = "\uFEFF"
      csv_data = CSV.generate(bom) do |csv|
        header = %w(氏名 グループ No1川柳（女性パワーで未来を変えるの部） 推薦理由（女性パワーで未来を変えるの部） No1川柳（ジェンダー・多様性の部） 推薦理由（ジェンダー・多様性の部） No1川柳（はたらく女子の部） 推薦理由（はたらく女子の部） No1川柳（ママ・子どもの部） 推薦理由（ママ・子どもの部）  
                    No1川柳（名もなき家事の部） 推薦理由（名もなき家事の部） No1川柳（本当にありがとう❣️感謝の部） 推薦理由（本当にありがとう❣️感謝の部） No1川柳（あるある❣️の部） 推薦理由（あるある❣️の部） No1川柳（涙がポロ❣️の部） 推薦理由（涙がポロ❣️の部） 
                    No1川柳（輝け❣️私のライフスタイルの部） 推薦理由（輝け❣️私のライフスタイルの部） No1川柳（心がきゅん❣️私の癒しの部） 推薦理由（心がきゅん❣️私の癒しの部） No1川柳（SDGsアクションの部） 推薦理由（SDGsアクションの部）)
        csv << header

        voterposts.each do |voterpost|
          voter = Voter.find_by(id: voterpost.voter_id)
          values = [voter.name, voter.group, voterpost.favorite_post1, voterpost.reason1, voterpost.favorite_post2, voterpost.reason2, voterpost.favorite_post3, voterpost.reason3, voterpost.favorite_post4, voterpost.reason4,
                    voterpost.favorite_post5, voterpost.reason5, voterpost.favorite_post6, voterpost.reason6, voterpost.favorite_post7, voterpost.reason7, voterpost.favorite_post8, voterpost.reason8,
                    voterpost.favorite_post9, voterpost.reason9, voterpost.favorite_post10, voterpost.reason10, voterpost.favorite_post11, voterpost.reason11]
          csv << values
        end
      end
    # else
    #   bom = "\uFEFF"
    #   csv_data = CSV.generate(bom) do |csv|
    #     header = %w(氏名 グループ No1川柳（女性パワーで未来を変えるの部） 推薦理由（女性パワーで未来を変えるの部） No1川柳（ジェンダー・多様性の部） 推薦理由（ジェンダー・多様性の部） No1川柳（はたらく女子の部） 推薦理由（はたらく女子の部） No1川柳（ママ・子どもの部） 推薦理由（ママ・子どもの部）  
    #                 No1川柳（名もなき家事の部） 推薦理由（名もなき家事の部） No1川柳（本当にありがとう❣️感謝の部） 推薦理由（本当にありがとう❣️感謝の部） No1川柳（あるある❣️の部） 推薦理由（あるある❣️の部） No1川柳（涙がポロ❣️の部） 推薦理由（涙がポロ❣️の部） 
    #                 No1川柳（輝け❣️私のライフスタイルの部） 推薦理由（輝け❣️私のライフスタイルの部） No1川柳（心がきゅん❣️私の癒しの部） 推薦理由（心がきゅん❣️私の癒しの部） No1川柳（SDGsアクションの部） 推薦理由（SDGsアクションの部）)
    #     csv << header
        
    #     voter_ids = Voter.where(id: voterposts.select(:voter_id)).where(group: params[:group_name]).ids
    #     voter_ids.each do |voter_id|
    #       voter = Voter.find_by(id: voter_id)
    #       voterpost = voterposts.find_by(voter_id: voter_id)
    #       # debugger
    #       values = [voter.name, voter.group, voterpost.favorite_post1, voterpost.reason1, voterpost.favorite_post2, voterpost.reason2, voterpost.favorite_post3, voterpost.reason3, voterpost.favorite_post4, voterpost.reason4,
    #                 voterpost.favorite_post5, voterpost.reason5, voterpost.favorite_post6, voterpost.reason6, voterpost.favorite_post7, voterpost.reason7, voterpost.favorite_post8, voterpost.reason8,
    #                 voterpost.favorite_post9, voterpost.reason9, voterpost.favorite_post10, voterpost.reason10, voterpost.favorite_post11, voterpost.reason11]
    #       csv << values
    #     end
    #   end
    # end
    send_data(csv_data, filename: "jokatsu_senryu_voters.csv")
  end
  

  def users_index
    @search_params = user_search_params
    @users = User.search(@search_params).paginate(page: params[:page],per_page: 50)
    # @users_count = User.distinct.count(:name)
    @users_count = User.count('DISTINCT name')

  end

  def users_show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  def voterposts_index
    @voters_admin = Voter.all.order(:group)
    @voters = Voter.where(group: current_staff.group_name)
  end

  def users_graph
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
