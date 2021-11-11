require 'rails_helper'

RSpec.describe 'User Dashboard' do
  describe 'As a verified User' do
    describe 'With Successful Login' do
      before :each do
        login_with_oauth
        @user = UserFacade.user_get(10)
      end

      it 'Flash Message shows successsful login' do
        expect(page).to have_content('Login Successful')
      end

      #Display Info
      it 'displays user name' do
        expect(page).to have_content(@user.name)
      end

      it 'displays user-info' do
        expect(page).to have_content(@user.address)
        expect(page).to have_content(@user.ski_pass)
        expect(page).to have_content(@user.ski_or_board)
        expect(page).to have_content(@user.exp_level)
        expect(page).to have_content(@user.emergency_name)
        expect(page).to have_content(@user.emergency_number)
      end

      it 'has a button to edit user info' do
        click_on 'Edit info'
        expect(current_path).to eq(edit_user_path(@user.id))
      end

      # it 'returns message with no Upcoming Trips' do
      #   expect(page).to have_content('No Upcoming Trips')
      # end
      #
      # it 'returns message with no friends added' do
      #   expect(page).to have_content('You have not added any friends yet!')
      # end

      # it 'returns Upcoming Trips' do
      #   within("#upcoming-trips") do
      #     # save_and_open_page
      #     require "pry"; binding.pry
      #     expect(page).to have_content('Christmas Trip')
      #     # expect(page).to have_content(@user[[:resort_name])
      #     # expect(page).to have_content(trip[:start_date])
      #     # expect(page).to have_content(trip[:end_date])
      #   end
      # end
    end
  end

  # describe 'Logout' do
  #   it 'has a logout button' do
  #     allow(ApplicationController).receive(:current_user).and_return(@user_attributes)
  #     expect(page).to have_link('Logout')
  #   end
  #
  #   context 'Successful' do
  #     it 'Will log the User out' do
  #       click_link 'Logout'
  #       expect(current_path).to eq(root_path)
  #     end
  #
  #     it 'Flash message shows logout' do
  #       click_link 'Logout'
  #       expect(page).to have_content('Logout successful')
  #     end
  #   end
  # end
end
