require 'rails_helper'

RSpec.describe Category, type: :model do
  context "relationship" do
    it { should have_many(:fact_results).through(:fact_result_categories) }
  end
  
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  context "when trying to save a category with the same name" do
    let!(:category) { FactoryBot.create(:category, name: "dev") }
    let(:new_category) { FactoryBot.build(:category, name: "dev") }
    
    it 'should not persist' do
      expect(category.name).to eq( "dev" )
      expect(new_category.save).to be(false)
    end
  end

  context "Validate FactoryBot" do
    context 'When is valid' do
      it 'should create a valid' do
        expect(FactoryBot.create :category).to be_valid
      end
    end
    
    context 'When is invalid' do
      let(:invalid_category) { FactoryBot.build :search, :invalid } 
      
      it 'should not create a search' do
        expect(invalid_category).to_not be_valid
        expect(invalid_category.save).to be(false)
      end
    end
  end
end
