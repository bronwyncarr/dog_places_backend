# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Location, type: :model do
  subject { FactoryBot.create(:location) }
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a address' do
      subject.address = nil
      expect(subject).to_not be_valid
    end
  end
end
