require 'rails_helper'
#
RSpec.describe TripService, :vcr do
  it 'posts a trip' do
    result = TripService.create_trip({ name: 'Happy fun time', start_date: '11/11/1111', end_date: '22/22/2222', resort_id: 2 })
    # require "pry"; binding.pry
    expect(result).to be_a(Hash)
    expect(result.size).to eq(3)
    expect(result.first).to be_a(Array)
    expect(result[:attributes][:resort_id]).to eq(2)
  end

  it 'returns a trip' do
    result = TripService.trip_get(47)
    expect(result).to be_a(Hash)
    expect(result.size).to eq(3)
    expect(result.first).to be_a(Array)
    expect(result[:attributes][:start_date]).to eq('2021-11-08')
    expect(result[:attributes][:end_date]).to eq('2021-11-25')
  end

  it 'updates a trip' do
    result = TripService.update_trip(48, {
                                            name: 'This is a trip',
                                            start_date: '2021-11-09',
                                            end_date: '2021-11-10'
                                            })
    expect(result).to be_a(Hash)
    expect(result.size).to eq(3)
    expect(result.first).to be_a(Array)
    expect(result[:attributes]).to have_key :name
    expect(result[:attributes]).to have_key :start_date
    expect(result[:attributes]).to have_key :end_date
  end
end
