require 'rails_helper'

RSpec.describe UserService, :vcr do
  it 'has a users' do
    result = UserService.user_auth('mikeosmonson@gmail.com')

    expect(result).to be_a(Hash)
    expect(result.size).to eq(1)
    expect(result.first).to be_a(Array)
    expect(result[:data][:attributes][:email]).to eq('mikeosmonson@gmail.com')
  end
end
