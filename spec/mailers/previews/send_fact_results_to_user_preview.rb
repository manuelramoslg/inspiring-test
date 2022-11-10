# Preview all emails at http://localhost:3000/rails/mailers/send_fact_results_to_user
class SendFactResultsToUserPreview < ActionMailer::Preview
  def send_email
    @email = Faker::Internet.email
    @data = FactoryBot.create(:fact_result)
    SendFactResultsToUserMailer.send_email(params[:email], data).deliver_now
  end
end