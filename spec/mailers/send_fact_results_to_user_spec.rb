require "rails_helper"

RSpec.describe SendFactResultsToUserMailer, type: :mailer do
  describe "send email" do
    let(:email) { Faker::Internet.email }
    let(:data) { FactoryBot.create_list(:fact_result, 2) }
    let(:mail) { SendFactResultsToUserMailer.send_email(email, data) }

    it "renders the headers" do
      expect(mail.to).to eq([email])
    end
  end
end
