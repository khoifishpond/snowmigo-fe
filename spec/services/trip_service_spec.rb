require 'rails_helper'
RSpec.describe TripService, :vcr do
  it 'posts a trip' do
    result = TripService.create_trip({ name: 'Happy fun time',
                                       start_date: '11/11/1111',
                                       end_date: '22/22/2222',
                                       resort_id: '2',
                                       user_id: '7' })
    expect(result).to be_a(Hash)
    expect(result.size).to eq(3)
    expect(result.first).to be_a(Array)
    expect(result[:attributes][:name]).to eq('Happy fun time')
  end

  it 'returns a trip' do
    result = TripService.trip_get(1)
    expect(result).to be_a(Hash)
    expect(result.size).to eq(3)
    expect(result.first).to be_a(Array)
    expect(result[:attributes][:start_date]).to eq('2021-11-02')
    expect(result[:attributes][:end_date]).to eq('2021-11-08')
  end

  it 'updates a trip' do
    result = TripService.update_trip(3, {
                                       name: 'This is a trip',
                                       start_date: '2021-11-09',
                                       end_date: '2021-11-10'
                                     })
    expect(result).to be_a(Hash)
    expect(result.size).to eq(3)
    expect(result.first).to be_a(Array)
    expect(result[:attributes][:name]).to eq('This is a trip')
    expect(result[:attributes][:start_date]).to eq('2021-11-09')
    expect(result[:attributes][:end_date]).to eq('2021-11-10')
  end

  # it 'deletes a trip record' do
  #   result = TripService.destroy_data
  # end
end
