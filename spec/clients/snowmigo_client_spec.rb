require 'rails_helper'

RSpec.describe SnowmigoClient, :vcr do
  it 'returns post json data' do
    result = SnowmigoClient.post_data('/api/v1/users', { 'email': 'mikeosmonson@gmail.com' })
    result = result[:data]
    expect(result.size).to eq(4)
    expect(result).to be_a(Hash)
  end

  it 'returns get json data' do
    result = SnowmigoClient.fetch("/api/v1/users/4")
    result = result[:data]
    expect(result.size).to eq(4)
    expect(result).to be_a(Hash)
  end

  it 'returns patch json data' do
    result = SnowmigoClient.patch_data('/api/v1/users/4', {
                                                            name: 'Ozzie',
                                                            email: 'mikeosmonson@gmail.com',
                                                            address: 'Denver',
                                                            pass_type: 'Epic',
                                                            ride_type: 'snow board',
                                                            xp_level: 'expert',
                                                            emergency_name: 'Christina',
                                                            emergency_number: '3945638198'
                                                           }
                                                          )
    result = result[:data]
    expect(result.size).to eq(4)
    expect(result).to be_a(Hash)
  end

  it 'deletes data' do
    result = SnowmigoClient.destroy_data("/api/v1/trips/6")
  end
end
