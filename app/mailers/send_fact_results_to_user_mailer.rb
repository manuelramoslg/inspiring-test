class SendFactResultsToUserMailer < ApplicationMailer
  default from: 'chuck@norris.fact'

  def send_email(email, data)
    @email = email
    @data = data
    mail(to: email, subject: I18n.t("mailer.subject"))
  end
  
end
