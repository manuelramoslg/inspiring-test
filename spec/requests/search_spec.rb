# frozen_string_literal: true

require 'rails_helper'
RSpec.describe '/searches', type: :request do
  let(:valid_attributes) do
    FactoryBot.attributes_for(:search)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Search.create! valid_attributes
      get searches_index_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Search' do
        expect do
          post searches_create_url, params: { search: valid_attributes }
        end.to change(Search, :count).by(1)
      end

      it 'redirects to the index search' do
        post searches_create_url, params: { search: valid_attributes }
        expect(response).to redirect_to(searches_index_url)
      end
    end
  end
end
