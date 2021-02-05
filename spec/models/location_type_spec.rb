# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationType, type: :model do
  subject { FactoryBot.create(:location_type) }
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
end
