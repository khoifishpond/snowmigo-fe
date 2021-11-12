require 'rails_helper'
RSpec.describe TripService, :vcr do
  it 'posts a trip' do
    result = TripService.create_trip({ "name": "Happy fun time",
                                      "start_date": "2021-11-08",
                                      "end_date": "2021-11-25",
                                      "user_id": 9 })
    expect(result).to be_a(Hash)
    expect(result.size).to eq(3)
    expect(result.first).to be_a(Array)
    expect(result[:attributes][:name]).to eq('Happy fun time')
  end

  it 'returns a trip' do
    result = TripService.trip_get(6)
    expect(result).to be_a(Hash)
    expect(result.size).to eq(3)
    expect(result.first).to be_a(Array)
    expect(result[:attributes][:start_date]).to eq('2025-11-02')
    expect(result[:attributes][:end_date]).to eq('2025-12-12')
  end

  it 'updates a trip' do
    result = TripService.update_trip(7, { name: 'Happy time',
                                          start_date: '11/09/2021',
                                          end_date: '11/10/2021',
                                          resort_id: 3 })
    expect(result).to be_a(Hash)
    expect(result.size).to eq(3)
    expect(result.first).to be_a(Array)
    expect(result[:attributes][:name]).to eq('Happy time')
    expect(result[:attributes][:start_date]).to eq('2021-09-11')
    expect(result[:attributes][:end_date]).to eq('2021-10-11')
  end

  # it 'deletes a trip record' do
  #   result = TripService.destroy_data
  # end
end
