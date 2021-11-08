require 'rails_helper'

RSpec.describe UserService, :vcr do
  it 'has a users' do
    result = UserService.user_auth('mikeosmonson@gmail.com', 'mike')
    expect(result).to be_a(Hash)
    expect(result.size).to eq(4)
    expect(result.first).to be_a(Array)
    expect(result[:attributes][:email]).to eq('mikeosmonson@gmail.com')
  end

  it 'gets a specific user' do
    result = UserService.user_get(4)

    expect(result).to be_a(Hash)
    expect(result.size).to eq(4)
    expect(result[:id]).to eq("4")
  end

  it 'updates user info' do
    result = UserService.user_update(4, {
                                          name: 'Ozzie',
                                          email: 'mikeosmonson@gmail.com',
                                          address: 'Denver',
                                          ski_pass: 'Epic',
                                          ski_or_board: 'snow board',
                                          exp_level: 'expert',
                                          emergency_name: 'Christina',
                                          emergency_number: '3945638198'
                                         })
    expect(result).to be_a(Hash)
    expect(result.size).to eq(4)
    expect(result[:attributes]).to have_key :name
    expect(result[:attributes]).to have_key :email
    expect(result[:attributes]).to have_key :address
    expect(result[:attributes]).to have_key :ski_pass
    expect(result[:attributes]).to have_key :ski_or_board
    expect(result[:attributes]).to have_key :exp_level
    expect(result[:attributes]).to have_key :emergency_name
    expect(result[:attributes]).to have_key :emergency_number
  end
end
