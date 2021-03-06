require 'rails_helper'

RSpec.describe 'User Dashboard'do
  describe 'As a verified User', :vcr  do
    describe 'With Successful Login' do
      before :each do
        login_with_oauth

        @user = UserFacade.user_get(2)
      end

      it 'Flash Message shows successsful login' do
        expect(page).to have_content('Login Successful')
      end

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

      it 'returns Upcoming Trips' do
        within("#upcoming-trips") do
          expect(page).to have_content(@user.trips[0][:data][:attributes][:name])
          expect(page).to have_content(@user.trips[0][:data][:attributes][:start_date])
          expect(page).to have_content(@user.trips[0][:data][:attributes][:end_date])
        end
      end

      context 'Logout' do
        it 'has a logout button' do
          expect(page).to have_link('Logout')
        end

        it 'Will log the User out' do
          click_link 'Logout'
          expect(current_path).to eq(root_path)
        end

        it 'Flash message shows logout' do
          click_link 'Logout'
          expect(page).to have_content('Logout successful')
        end
      end
    end
  end

  describe 'User Friends', :vcr do
    before :each do
      login_with_oauth
      @user11 = UserFacade.user_get(3)
    end

    it 'returns friends' do
      expect(page).to have_content('Greedo')
    end

    it 'can add friends' do
      fill_in :email, with: @user11.email
      click_on 'Add Friend'

      expect(page).to have_content(@user11.name)
    end
  end
end
