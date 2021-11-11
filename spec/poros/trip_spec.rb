require 'rails_helper'

RSpec.describe Trip do
  let(:trip) do
    Trip.new( { id: 47,
                       attributes: { name: 'trip',
                                     start_date: '08/11/2021',
                                     end_date: '25/11/2021',
                                     vote_status: 'open',
                                     resort_id: 2,
                                     riders: [{
                                                data: {
                                                  attributes: {
                                                    user_id: 1,
                                                    trip_id: 47,
                                                    host: false,
                                                    driver: false,
                                                    budget: 42,
                                                    rider_name: "Khoi"
                                                  }
                                                }
                                      }],
                                      resort_options: [{
                                        data: {
                                          id: 1,
                                          attributes: {
                                            trip_id: 47,
                                            resort_id: 2,
                                            resort_name: 'Granby',
                                            vote_count: 0
                                          }
                                        }
                                      }]
                                   }
                      })
  end
  it 'has attributes' do
    expect(trip.id).to eq(47)
    expect(trip.name).to eq('trip')
    expect(trip.start_date).to eq('08/11/2021')
    expect(trip.end_date).to eq('25/11/2021')
    expect(trip.vote_status).to eq("open")
    expect(trip.resort_id).to eq(2)
    expect(trip.riders.first[:data][:attributes][:rider_name]).to eq('Khoi')
    expect(trip.options.first[:data][:attributes][:resort_name]).to eq('Granby')
  end

  it 'formats the start date' do
    expect(trip.format_start_date).to eq('Nov 8, 2021')
  end

  it 'formats the end date' do
    expect(trip.format_end_date).to eq('Nov 25, 2021')
  end
end
