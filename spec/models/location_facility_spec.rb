# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationFacility, type: :model do
  subject { FactoryBot.create(:location_facility) }
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
end
