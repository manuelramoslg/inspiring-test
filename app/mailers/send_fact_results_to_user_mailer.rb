class SendFactResultsToUserMailer < ApplicationMailer
  default from: 'manuelramoslg@gmail.com'

  def send_email(email, data)
    @email = email
    @data = data
    mail(to: email, subject: "Your fact results")
  end
  
end
