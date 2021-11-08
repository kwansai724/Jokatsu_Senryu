class PostedMailer < ApplicationMailer
  # default from: <メールで表示される送信元>, subject: <メールで表示されるタイトル>
  default from: Rails.application.credentials[:MY_GMAIL], subject: "ジョカツ川柳の投稿ありがとうございます。"
  def send_mail(user)
    @user = user
    mail to: user.email
  end
end
