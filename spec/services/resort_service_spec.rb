require 'rails_helper'

RSpec.describe ResortService do
  it '#resorts_by_state', :vcr do
    resorts = ResortService.resorts_by_state('co')
    expect(resorts).to be_a Hash
    expect(resorts[:data]).to be_an Array
    resorts[:data].each do |resort|
      expect(resort).to be_a(Hash)
      expect(resort).to have_key(:type)
      expect(resort[:type]).to be_a(String)

      expect(resort).to have_key(:id)
      expect(resort[:id]).to be_a(String)

      expect(resort).to have_key(:attributes)
      expect(resort[:attributes]).to be_a(Hash)
      expect(resort[:attributes]).to have_key(:name)
      expect(resort[:attributes][:name]).to be_a(String)
    end
  end
end
