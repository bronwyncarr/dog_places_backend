# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  subject { FactoryBot.create(:review) }
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    context 'when the review is valid' do
      before(:example) do
        @review = FactoryBot.attributes_for(:review, :invalid)
        post reviews_path, params: { review: review_params }
        it 'should return unprocessable entity' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
