# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:searches).class_name('Search') }
  end

  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  context 'On Create' do
    it 'should create an invalid' do
      expect(FactoryBot.build(:guest_user, :invalid)).to_not be_valid
    end
  end

  context 'Validate FactoryBot' do
    context 'When is valid' do
      it 'should create a valid' do
        expect(FactoryBot.create(:guest_user)).to be_valid
      end
    end

    context 'When is invalid' do
      let(:invalid_guest_user) { FactoryBot.build :guest_user, :invalid }

      it 'should not create a guest_user' do
        expect(invalid_guest_user).to_not be_valid
        expect(invalid_guest_user.save).to be(false)
      end
    end
  end
end
