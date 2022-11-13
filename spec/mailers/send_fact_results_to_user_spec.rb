# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SendFactResultsToUserMailer, type: :mailer do
  describe 'send email' do
    let(:to_email) { Faker::Internet.email }
    let(:current_or_guest_user_email) { Faker::Internet.email }
    let(:mail) { SendFactResultsToUserMailer.send_email(current_or_guest_user_email, to_email) }

    it 'renders the headers' do
      expect(mail.to).to eq([to_email])
    end
  end
end
