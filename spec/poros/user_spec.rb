require 'rails_helper'

describe User do
  let(:user) do
    User.new({
              id: 5,
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
                  {
                    id: 1,
                    resort_id: 2,
                    start_date: '2022-12-23',
                    end_date: '2022-12-27',
                    created_at: '2021-11-10T02:31:25.947Z',
                    name: 'Christmas Trip',
                    resort_name: 'Vail'
                  },
                  {
                    id: 2,
                    resort_id: 2,
                    start_date: '2011-12-30',
                    end_date: '2012-01-04',
                    created_at: '2021-11-10T02:31:25.947Z',
                    name: 'New Years Trip',
                    resort_name: 'Keystone'
                  }
                ]
              }
            })
  end

  it 'has attributes' do
    expect(user.name).to eq('Freddie Mercury')
    expect(user.email).to eq('example@gmail.com')
    expect(user.id).to eq(5)
    expect(user.exp_level).to eq('expert')
    expect(user.ski_pass).to eq('epic')
    expect(user.address).to eq('Denver')
    expect(user.ski_or_board).to eq('ski')
    expect(user.emergency_name).to eq('Xtina')
    expect(user.emergency_number).to eq('8675309')
  end

  it 'has upcoming trips' do
    expect(user.upcoming_trips.first[:name]).to eq('Christmas Trip')
  end

  it 'has past trips' do
    expect(user.past_trips.first[:name]).to eq('New Years Trip')

  end
end
