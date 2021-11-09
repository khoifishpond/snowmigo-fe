require 'rails_helper'

RSpec.describe 'Destroy' do
  describe 'As an Authorized User' do
    before {
      login_with_oauth
      @user_attributes = {
        id: 5,
        attributes: {
          name: 'Freddie Mercury',
          email: 'example@gmail.com',
          exp_level: nil,
          ski_pass: nil,
          address: nil,
          ski_or_board: nil,
          emergency_name: nil,
          emergency_number: nil
        }
      }
    }

    # context 'Successful Delete' do
    #   it 'has a button to Delete a trip' do
    #     expect(page).to have_button('Delete')
    #   end
    #
    #   it 'deletes a trip when selected' do
    #     click_on 'Delete'
    #
    #     expect(response).to be_successful
    #     expect(page).to have_content('Delete Successful')
    #   end
    # end
    #
    # context 'Unuccessful Delete' do
    #   it 'does not delete a trip when selected' do
    #     click_on 'Delete'
    #
    #     expect(response).to be_successful
    #     expect(page).to have_content('Delete Successful')
    #   end
    # end
  end
end
