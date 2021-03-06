require 'rails_helper'

RSpec.describe UserFacade, :vcr do
  describe 'user authentication' do
    it 'returns a specific user' do
      result = UserFacade.user_auth('allan_cruickshank@powlowski.com@gmail.com', 'Greedo')
      expect(result).to be_a(User)
    end

    it 'retrieves user from database' do
      result = UserFacade.user_get(4)
      expect(result).to be_a(User)
    end

    it 'updates user info' do
      result = UserFacade.user_update(9, {
                                        "name": "Ozzie",
                                        "email": "mikeosmonson@gmail.com",
                                        "address": "Denver",
                                        "ski_pass": "Epic",
                                        "ski_or_board": "snowboard",
                                        "exp_level": "expert",
                                        "emergency_name": "Christina",
                                        "emergency_number": "3945638198"
                                      })
      expect(result).to be_a(User)
    end
  end
end
