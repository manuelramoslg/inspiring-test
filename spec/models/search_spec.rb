require 'rails_helper'

RSpec.describe Search, type: :model do
  context "relationship" do
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:fact_results).class_name('FactResult') }

  end
  
  context 'validations' do
    it { should validate_presence_of(:user) }
  end

  context "Validate FactoryBot" do
    context 'When is valid' do
      it 'should create a valid' do
        expect(FactoryBot.create :search).to be_valid
      end
    end
    
    context 'When is invalid' do
      let(:invalid_search) { FactoryBot.build :search, :invalid } 
      
      it 'should not create a search' do
        expect(invalid_search).to_not be_valid
        expect(invalid_search.save).to be(false)
      end
    end
  end
end
