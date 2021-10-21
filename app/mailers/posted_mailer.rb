class PostedMailer < ApplicationMailer
  # default from: <メールで表示される送信元>, subject: <メールで表示されるタイトル>
  default from: 'ahimihimi53@gmail.com', subject: "ジョカツ川柳の投稿ありがとうございます。"
  def send_mail(user)
    @user = user
    mail to: user.email
  end
end
