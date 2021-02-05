# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user validations' do
    before(:example) do
      @vaild_user = FactoryBot.create(:user)
      @invaild_user = FactoryBot.create(:user, :invalid)

      context 'validations' do
        it 'is valid with valid attributes' do
          expect(@valid_user).to be_valid
        end
        it 'is invalid without an email' do
          expect(@invalid_user).to be_invaid
        end
      end
    end
  end
end
