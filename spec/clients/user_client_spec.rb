require 'rails_helper'

RSpec.describe UserClient, :vcr do
  it 'returns post json data' do
    result = UserClient.post_data('/api/v1/users', { 'email': 'mikeosmonson@gmail.com' })
    result = result[:data]
    expect(result.size).to eq(3)
    expect(result).to be_a(Hash)
  end

  it 'returns get json data' do
    result = UserClient.fetch("/api/v1/users/4")
    result = result[:data]
    expect(result.size).to eq(3)
    expect(result).to be_a(Hash)
  end
end
