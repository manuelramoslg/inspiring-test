# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FactResultCategory, type: :model do
  it { should belong_to(:fact_result) }
  it { should belong_to(:category) }

  context 'Validate FactoryBot' do
    context 'When is valid' do
      it 'should create a valid' do
        expect(FactoryBot.create(:fact_result_category)).to be_valid
      end
    end

    context 'When is invalid' do
      let(:invalid_fact_result_category) { FactoryBot.build :fact_result_category, :invalid }

      it 'should not create a search' do
        expect(invalid_fact_result_category).to_not be_valid
        expect(invalid_fact_result_category.save).to be(false)
      end
    end
  end
end
