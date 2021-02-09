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
  context 'review attaches to a location' do
    before(:example) do
      @location = FactoryBot.create(:location)
      @review = FactoryBot.create(:review)
      @review.location_id = @location.id
      @review.save
      it('attaches to a location') do
        expect(@review.location_id).to eq(@location.id)
      end
    end
  end
end
