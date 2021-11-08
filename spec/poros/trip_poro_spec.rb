require 'rails_helper'

RSpec.describe TripPoro do
  let(:trip) { TripPoro.new({ id: 1, attributes: { name: 'Happy fun time', start_date: '11/11/1111', end_date: '11/22/2022', resort_id: 2 } }) }
  it 'has attributes' do
    expect(trip.id).to eq(1)
    expect(trip.name).to eq('Happy fun time')
    expect(trip.start_date).to eq('11/11/1111')
    expect(trip.end_date).to eq('11/22/2022')
    expect(trip.resort_id).to eq(2)
  end

  it 'formats the start date' do
    expect(trip.format_start_date).to eq('Nov 11, 1111')
  end

  it 'formats the end date' do
    expect(trip.format_end_date).to eq('Nov 22, 2022')
  end
end
