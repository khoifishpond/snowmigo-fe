require 'rails_helper'

RSpec.describe UserService do
  it 'has a users' do
    result = UserService.user_auth

    expect(result).to be_a(Array)
    expect(result.size).to eq(1)
    expect(result.first).to be_a(Hash)
    expect(result.first[:email]).to be_a(String)
  end
end
