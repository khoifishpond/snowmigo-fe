require 'rails_helper'

describe User do
  let(:user) do
    User.new({ id: 1,
               attributes: { name: 'Khoi', email: 'khois@email.com', exp_level: 'expert', ski_pass: 'epic', address: 'Denver',
                             ski_or_board: 'ski', emergency_name: 'Xtina', emergency_number: '8675309' } })
  end

  it 'has attributes' do
    expect(user.name).to eq('Khoi')
    expect(user.email).to eq('khois@email.com')
    expect(user.id).to eq(1)
    expect(user.exp_level).to eq('expert')
    expect(user.ski_pass).to eq('epic')
    expect(user.address).to eq('Denver')
    expect(user.ski_or_board).to eq('ski')
    expect(user.emergency_name).to eq('Xtina')
    expect(user.emergency_number).to eq('8675309')
  end
end
