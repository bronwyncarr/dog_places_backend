require 'rails_helper'

RSpec.describe Review, type: :model do
  subject { FactoryBot.create(:review) }
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
end
