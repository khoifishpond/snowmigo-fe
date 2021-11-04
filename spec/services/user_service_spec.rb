require 'rails_helper'

RSpec.describe UserService, :vcr do
  it 'has a users' do
    result = UserService.user_auth('mikeosmonson@gmail.com', 'mike')
    expect(result).to be_a(Hash)
    expect(result.size).to eq(3)
    expect(result.first).to be_a(Array)
    expect(result[:attributes][:email]).to eq('mikeosmonson@gmail.com')
  end

  it 'gets a specific user' do
    result = UserService.user_get(4)

    expect(result).to be_a(Hash)
    expect(result.size).to eq(3)
    expect(result[:id]).to eq("4")
  end
end
