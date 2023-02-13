require 'csv'
require 'nkf'

class Staffs::StaffsController < ApplicationController
  before_action :staff_only
  before_action :correct_staff
  before_action :detect_device, only: [:voterposts_show]

  def toppage
  end

  def index
    # 投票者別ランキング
    @post_like = Post.find(Like.where(voter_id: Voter.where(group: params[:group_name]).ids)
                     .group(:post_id).order(Arel.sql('count(post_id) desc')).pluck(:post_id))

    # カテゴリー別に表示
    @post_rank = @post_like.select { |post| post.category == params[:category_name] }.paginate(page: params[:page], per_page: 100)
    @posts_index = Post.eager_load(:user).where(category: params[:category_name]).paginate(page: params[:page], per_page: 100)
    @staffs = Staff.where(admin: false)
    @staff = Staff.find_by(group_name: params[:group_name])
    @users = User.eager_load(:posts).all
    @posts = Post.all.where.not(first_phrase: "")
    @voters = Voter.eager_load(:voterposts).all
    @voterposts = Voterpost.all.order(voter_id: "ASC")

    case params[:key]
    when "posts"
      send_posts_csv(@posts)
    when "users"
      send_users_csv(@users)
    when "voters"
      send_voters_csv(@voterposts)
    end
  end

  # 川柳csv出力
  def send_posts_csv(posts)
    bom = "\uFEFF"
    csv_data = if current_staff.admin
                 CSV.generate(bom) do |csv|
                   header = %w[No 上の句 中の句 下の句 ペンネーム 部門 氏名 Email 性別 お住まい 職業 年代 メッセージ アンケート 得票数（WIP） 得票数（全体）]
                   csv << header

                   posts.each do |post|
                     user = User.find_by(id: post.user_id)
                     count_votes_for_wip = Like.where(voter_id: Voter.where(group: params[:group_name]).ids)
                                               .where(post_id: post.id).count
                     count_votes_for_all = Like.where(post_id: post.id).count
                     values = posts_csv_values_for_admin(post, user, count_votes_for_wip, count_votes_for_all)
                     csv << values
                   end
                 end
               else
                 CSV.generate(bom) do |csv|
                   header = %w[No 上の句 中の句 下の句 ペンネーム 部門 性別 お住まい 職業 年代 メッセージ アンケート 得票数]
                   csv << header

                   posts.each do |post|
                     user = User.find_by(id: post.user_id)
                     count_votes_for_other = Like.where(voter_id: Voter.where(group: params[:group_name]).ids)
                                                 .where(post_id: post.id).count
                     values = posts_csv_values_for_other(post, user, count_votes_for_other)
                     csv << values
                   end
                 end
               end
    send_data(csv_data, filename: "jokatsu_senryu.csv")
  end

  # 投稿者csv出力
  def send_users_csv(users)
    bom = "\uFEFF"
    csv_data = CSV.generate(bom) do |csv|
      header = %w[No 氏名 Email 性別 お住まい 職業 （職業：その他） 年代 メッセージ アンケート]
      csv << header

      users.each do |user|
        name = user.name.gsub(/[[:space:]]/, '').strip.tr('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z')
        name = NKF.nkf('-w -Z1', name)
        values = users_csv_values(user, name)
        csv << values
      end
    end
    send_data(csv_data, filename: "jokatsu_senryu_users.csv")
  end

  # 一押し川柳csv出力
  def send_voters_csv(voterposts)
    bom = "\uFEFF"
    csv_data = CSV.generate(bom) do |csv|
      header = %w[氏名 グループ No1川柳（女性パワーで未来を変えるの部） 推薦理由（女性パワーで未来を変えるの部）
                  No1川柳（ジェンダー・多様性の部） 推薦理由（ジェンダー・多様性の部） No1川柳（はたらく女子の部） 推薦理由（はたらく女子の部）
                  No1川柳（ママ・子どもの部） 推薦理由（ママ・子どもの部） No1川柳（名もなき家事の部） 推薦理由（名もなき家事の部）
                  No1川柳（本当にありがとう❣️感謝の部） 推薦理由（本当にありがとう❣️感謝の部） No1川柳（あるある❣️の部） 推薦理由（あるある❣️の部）
                  No1川柳（涙がポロ❣️の部） 推薦理由（涙がポロ❣️の部） No1川柳（輝け❣️私のライフスタイルの部） 推薦理由（輝け❣️私のライフスタイルの部）
                  No1川柳（心がきゅん❣️私の癒しの部） 推薦理由（心がきゅん❣️私の癒しの部） No1川柳（SDGsアクションの部） 推薦理由（SDGsアクションの部）]
      csv << header
      # if current_staff.admin
      voterposts.each do |voterpost|
        voter = Voter.find(voterpost.voter_id)
        values = voters_csv_values(voter, voterpost)
        csv << values
      end
      # 管理者以外は投票者csvをダウンロードする必要がないとのことでコメントアウト
      # else
      #   voter_ids = Voter.where(id: voterposts.select(:voter_id)).where(group: params[:group_name]).ids
      #   voter_ids.each do |voter_id|
      #     voter = Voter.find(voter_id)
      #     voterpost = voterposts.find_by(voter_id: voter_id)
      #     values = voters_csv_values(voter, voterpost)
      #     csv << values
      #   end
      # end
    end
    send_data(csv_data, filename: "jokatsu_senryu_voters.csv")
  end

  def users_index
    @search_params = user_search_params
    @users = User.search(@search_params).paginate(page: params[:page], per_page: 50)
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
    else
      # fileはtmpに自動で一時保存される
      Staff.import(params[:file])
      flash[:success] = "CSVファイルをインポートしました。"
    end
    redirect_to staffs_staffs_voterposts_index_url
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
    when /iPhone/, /Android/
      request.variant = :mobile
    end
  end

  # 川柳csvの管理者ダウンロード時の値
  def posts_csv_values_for_admin(post, user, count_votes_for_wip, count_votes_for_all)
    [
      post.id, post.first_phrase, post.second_phrase, post.third_phrase, post.pen_name, post.category,
      user.name, user.email, user.gender, user.address, user.profession, user.age, user.note, user.questionary,
      count_votes_for_wip, count_votes_for_all
    ]
  end

  # 川柳csvの管理者以外のダウンロード時の値
  def posts_csv_values_for_other(post, user, count_votes_for_other)
    [
      post.id, post.first_phrase, post.second_phrase, post.third_phrase, post.pen_name, post.category,
      user.gender, user.address, user.profession, user.age, user.note, user.questionary,
      count_votes_for_other
    ]
  end

  # 投稿者csvダウンロード時の値
  def users_csv_values(user, name)
    [
      user.id, name, user.email, user.gender, user.address, user.profession,
      user.other, user.age, user.note, user.questionary
    ]
  end

  # 一押し川柳csvダウンロード時の値
  def voters_csv_values(voter, voterpost)
    [
      voter.name, voter.group, voterpost.favorite_post1, voterpost.reason1, voterpost.favorite_post2,
      voterpost.reason2, voterpost.favorite_post3, voterpost.reason3, voterpost.favorite_post4,
      voterpost.reason4, voterpost.favorite_post5, voterpost.reason5, voterpost.favorite_post6,
      voterpost.reason6, voterpost.favorite_post7, voterpost.reason7, voterpost.favorite_post8,
      voterpost.reason8, voterpost.favorite_post9, voterpost.reason9, voterpost.favorite_post10,
      voterpost.reason10, voterpost.favorite_post11, voterpost.reason11, voterpost.favorite_post9,
      voterpost.reason9, voterpost.favorite_post10, voterpost.reason10, voterpost.favorite_post11, voterpost.reason11
    ]
  end
end
