require 'rails_helper'

describe UserPoro do
  let(:user) { UserPoro.new({ id: 1, attributes: { name: 'Khoi', email: 'khois@email.com' } }) }

  it 'has attributes' do
    expect(user.name).to eq('Khoi')
    expect(user.email).to eq('khois@email.com')
    expect(user.id).to eq(1)
  end
end
