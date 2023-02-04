class PostedMailer < ApplicationMailer
  # default from: <メールで表示される送信元>, subject: <メールで表示されるタイトル>
  if Rails.env.development?
    default from: Rails.application.credentials[:MY_GMAIL], subject: "ジョカツ川柳の投稿ありがとうございます。"
  elsif Rails.env.production?
    default from: ENV['MY_GMAIL'], subject: "ジョカツ川柳の投稿ありがとうございます。"
  end
  def send_mail(user, message)
    @user = user
    @message = message
    mail to: user.email
  end
end
