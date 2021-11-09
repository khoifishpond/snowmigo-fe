require 'rails_helper'

RSpec.describe 'user show/dashboard page', :vcr do
  describe 'requires a user' do
    #for when we use our require user method
    # it 'redirects if no user' do
    #   visit user_path
    #
    #   expect(current_path).to eq(root_path)
    #   expect(page).to have_content('Please login to access your account')
    # end
  end

  describe 'user info section' do
    before :each do
      login_with_oauth

      @user_attributes = { id: 5, attributes:
                          { name: 'Freddie Mercury', email: 'example@gmail.com',exp_level: nil,
                            ski_pass: nil, address: nil, ski_or_board: nil,
                            emergency_name: nil, emergency_number: nil
                        } }
    end

    it 'displays user info' do
      expect(page).to have_content(@user_attributes[:attributes][:name])
    end

    it 'has a button to edit user info' do
      click_on "Edit info"
      expect(current_path).to eq(edit_user_path(@user_attributes[:id]))
    end
  end
end
