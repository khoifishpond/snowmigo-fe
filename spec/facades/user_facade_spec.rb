require 'rails_helper'

RSpec.describe UserFacade, :vcr do
  describe 'user authentication' do
    it 'returns a specific user' do
      result = UserFacade.user_auth('mikeosmonson@gmail.com')
      expect(result).to be_a(UserPoro)
    end
  end
end
