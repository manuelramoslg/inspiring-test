# frozen_string_literal: true

class SendFactResultFactJob < ApplicationJob
  queue_as :default

  def perform(current_user_email, to_email)
    SendFactResultsToUserMailer.send_email(current_user_email, to_email).deliver_now
  end
end
