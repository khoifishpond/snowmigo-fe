require 'rails_helper'

RSpec.describe 'User Dashboard' do
  describe 'As a verified User' do
    describe 'With Successful Login' do
      before :each do
        login_with_oauth

        @user = {
          id: 5,
          attributes: {
            name: 'Freddie Mercury',
            email: 'example@gmail.com',
            exp_level: nil,
            ski_pass: nil,
            address: nil,
            ski_or_board: nil,
            emergency_name: nil,
            emergency_number: nil,
            trips: [
              {
                id: '1',
                resort_id: 2,
                start_date: '2010-12-23',
                end_date: '2010-12-27',
                created_at: '2021-11-10T02:31:25.947Z',
                name: 'Christmas Trip',
                resort_name: 'Vail'
              },
              {
                id: '2',
                resort_id: 2,
                start_date: '2011-12-30',
                end_date: '2012-01-04',
                created_at: '2021-11-10T02:31:25.947Z',
                name: 'New Years Trip',
                resort_name: 'Keystone'
              }
            ],
            friends: [
              {
                data: {
                  id: 5,
                  type: 'friendship',
                  attributes: {
                    user_id: 1,
                    friend_id: 2,
                    friend_name: 'Count Dooku'
                  }
                }
              }
            ]
          }
        }
      end

      it 'Flash Message shows successsful login' do
        expect(page).to have_content('Login Successful')
      end

      #Display Info
      it 'displays user info' do
        expect(page).to have_content(@user[:attributes][:name])
      end

      it 'has a button to edit user info' do
        click_on 'Edit info'

        expect(current_path).to eq(edit_user_path(@user[:id]))
      end

      it 'returns message with no Upcoming Trips' do
        expect(page).to have_content('No Upcoming Trips')
      end

      it 'returns message with no friends added' do
        expect(page).to have_content('You have not added any friends yet!')
      end

      it 'returns Upcoming Trips' do
        # within("#upcoming-trips") do
          save_and_open_page
          # require "pry"; binding.pry
          expect(page).to have_content('Christmas Trip')
          expect(page).to have_content(trip[:resort_name])
          expect(page).to have_content(trip[:start_date])
          expect(page).to have_content(trip[:end_date])
        # end
      end
    end
  end

  describe 'Logout' do
    @user = User.new({
      id: 5,
      attributes: {
        name: 'Freddie Mercury',
        email: 'example@gmail.com',
        exp_level: nil,
        ski_pass: nil,
        address: nil,
        ski_or_board: nil,
        emergency_name: nil,
        emergency_number: nil,
        trips: []
      }
    })
    it 'has a logout button' do
      allow(ApplicationController).receive(:current_user).and_return(@user_attributes)
      expect(page).to have_link('Logout')
    end

    context 'Successful' do
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
