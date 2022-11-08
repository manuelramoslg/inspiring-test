require 'rails_helper'

RSpec.describe Search, type: :model do
  context "relationship" do
    it { should belong_to(:user).class_name('User') }
  end
  
  context 'validations' do
    it { should validate_presence_of(:query) }
    it { should validate_presence_of(:user) }
  end

  context "when to create a search" do
    let(:search) { FactoryBot.create(:search, query: " CaReeR ") }
    
    it 'should remove white spaces and downcase query string' do
      expect(search.query).to eq( "career" )
    end
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
