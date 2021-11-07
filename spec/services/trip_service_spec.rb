require 'rails_helper'
#
RSpec.describe TripService, :vcr do
  it 'posts a trip' do
    result = TripService.create_trip({ name: 'Happy fun time', start_date: '11/11/1111', end_date: '22/22/2222', resort_id: 2 })
    # require "pry"; binding.pry
    expect(result).to be_a(Hash)
    expect(result.size).to eq(3)
    expect(result.first).to be_a(Array)
    expect(result[:attributes][:resort_id]).to eq(1)
  end
end
