require 'rails_helper'

describe User do
  let(:user) do
    User.new({
              id: 10,
              attributes: {
                name: 'Freddie Mercury',
                email: 'example@gmail.com',
                exp_level: 'expert',
                ski_pass: 'epic',
                address: 'Denver',
                ski_or_board: 'ski',
                emergency_name: 'Xtina',
                emergency_number: '8675309',
                trips: [
                  { data: {
                      id: 1,
                      attributes: {
                        resort_id: 2,
                        start_date: '2022-12-23',
                        end_date: '2022-12-27',
                        created_at: '2021-11-10T02:31:25.947Z',
                        name: 'Christmas Trip',
                        resort_name: 'Vail'
                      }
                    }
                  },
                  {
                    data: {
                      id: 2,
                      attributes: {
                        resort_id: 2,
                        start_date: '2011-12-30',
                        end_date: '2012-01-04',
                        created_at: '2021-11-10T02:31:25.947Z',
                        name: 'New Years Trip',
                        resort_name: 'Keystone'
                      }
                    }
                  }
                ],
                friends: [
                  data: {
                  id: 5,
                  attributes: {
                    friend_name: 'Henry',
                    friend_id: 5,
                    email: 'email@gmail.com',
                    exp_level: 'expert',
                    ski_pass: 'epic',
                    address: 'Denver',
                    ski_or_board: 'ski',
                    emergency_name: 'Mom',
                    emergency_number: '2078675309',
                  }
                }
              ]
            }
          })
  end

  it 'has attributes' do
    expect(user.name).to eq('Freddie Mercury')
    expect(user.email).to eq('example@gmail.com')
    expect(user.id).to eq(10)
    expect(user.exp_level).to eq('expert')
    expect(user.ski_pass).to eq('epic')
    expect(user.address).to eq('Denver')
    expect(user.ski_or_board).to eq('ski')
    expect(user.emergency_name).to eq('Xtina')
    expect(user.emergency_number).to eq('8675309')
  end

  it 'has upcoming trips' do
    expect(user.upcoming_trips.first[:data][:attributes][:name]).to eq('Christmas Trip')
    expect(user.upcoming_trips.first[:data][:attributes][:start_date]).to eq('2022-12-23')
    expect(user.upcoming_trips.first[:data][:attributes][:end_date]).to eq('2022-12-27')
    expect(user.upcoming_trips.count).to eq(1)
  end

  it 'has past trips' do
    expect(user.past_trips.first[:data][:attributes][:name]).to eq('New Years Trip')
    expect(user.past_trips.first[:data][:attributes][:start_date]).to eq('2011-12-30')
    expect(user.past_trips.first[:data][:attributes][:end_date]).to eq('2012-01-04')
    expect(user.upcoming_trips.count).to eq(1)
  end

  it 'gets friends to be added' do
    expect(user.friends_to_add(['Khoi'])).to eq([['Henry', 5]])
  end
end
