# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FactResult, type: :model do
  let!(:fact_result) { FactoryBot.create(:fact_result) }

  context 'relationship' do
    it { should have_many(:categories).through(:fact_result_categories) }
  end

  context 'validations' do
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:search) }
  end

  context 'Validate FactoryBot' do
    context 'When is valid' do
      it 'should create a valid' do
        expect(FactoryBot.create(:fact_result)).to be_valid
      end
    end

    context 'When is invalid' do
      let(:invalid_fact) { FactoryBot.build :search, :invalid }

      it 'should not create a search' do
        expect(invalid_fact).to_not be_valid
        expect(invalid_fact.save).to be(false)
      end
    end
  end
end
