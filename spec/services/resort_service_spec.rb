require 'rails_helper'

RSpec.describe ResortService do
  it '#resorts_by_state' do
    resorts = ResortService.resorts_by_state('co')
    expect(resorts).to be_a Hash
    expect(resorts[:data]).to be_an Array
    resorts[:data].each do |resort|
      expect(resort[:type]).to eq 'state_resort'
      expect(resort[:id]).to be_a String
      expect(resort[:attributes][:name]).to be_a String
    end
  end
end
