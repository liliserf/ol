require 'rails_helper'

describe 'Serializers' do
  let(:business) { FactoryGirl.create :business }
  subject do
    JSON.parse(BusinessSerializer.new(business).to_json)
  end

  describe 'structure' do
    it 'has no root key' do
      expect(subject.keys).not_to include('business', 'businesses')
    end

    it 'has all business attribute' do
      expect(subject.keys).to include(
        "id", "uuid", "name", "address", 
        "address2", "city", "state", "zip", 
        "country", "phone", "website", 
        "created_at")
    end

    it 'does not serialize updated_at' do
      expect(subject.keys).not_to include "updated_at"
    end
  end
end