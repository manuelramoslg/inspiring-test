# frozen_string_literal: true

class SendFactResultsToUserMailer < ApplicationMailer
  default from: 'chuck@norris.fact'

  def send_email(current_or_guest_user_email, to_email)
    @email = to_email
    @data = FactResult.joins(:search)
                      .where(search_id: Search.last)
                      .where(searches: { user: User.find_by(email: current_or_guest_user_email) })
    mail(to: to_email, subject: I18n.t('mailer.subject'))
  end
end
