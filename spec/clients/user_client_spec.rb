require 'rails_helper'

RSpec.describe UserClient, :vcr do
  it 'returns parsed json body' do
    result = UserClient.post_data('/api/v1/users', { 'email': 'mikeosmonson@gmail.com' })
    result = result[:data]
    expect(result.size).to eq(3)
    expect(result).to be_a(Hash)
  end
end
