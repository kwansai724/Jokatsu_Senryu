class GroupMailer < ApplicationMailer
  # default from: <メールで表示される送信元>, subject: <メールで表示されるタイトル>
  if Rails.env.development?
    default from: Rails.application.credentials[:MY_GMAIL]
  elsif Rails.env.production?
    default from: ENV.fetch('MY_GMAIL')
  end

  def send_announcement_mail(subject, comment, emails)
    @comment = comment
    xsmtp_api_params = { to: emails }
    headers['X-SMTPAPI'] = JSON.generate(xsmtp_api_params)
    mail(to: emails, subject: subject)
  end
end
