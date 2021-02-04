require 'rails_helper'

RSpec.describe Facility, type: :model do
  subject { FactoryBot.create(:facility) }
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
end
