require 'rails_helper'

RSpec.describe 'User Dashboard' do
  describe 'As a verified User' do
    describe 'With Successful Login' do
      before :each do
        login_with_oauth
        @user = UserFacade.user_get(7)
      end
      # it 'Flash Message shows success' do
      #   expect(page).to have_content('Login Successful')
      # end

      #Display Info
      it 'displays user info' do
        expect(page).to have_content(@user.name)
      end

      it 'has a button to edit user info' do
        click_on 'Edit info'

        expect(current_path).to eq(edit_user_path(@user.id))
      end


        it 'returns message with no friends added' do
          expect(page).to have_content('You have not added any friends yet!')
        end

        before {
          # @user2 = create(:user)
          @friend = Friend.new(user_id: @user[:id], friend_id: @user[:id] + 1, name: 'Frank')
          allow_any_instance_of(FriendshipFacade).to receive(:get_friend).and_return(@friend)
        }

        it 'returns friends' do
          expect(page).to have_content('Frank')
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

    xit 'has a logout button' do
      allow(ApplicationController).to receive(:current_user).and_return(@user_attributes)
      expect(page).to have_link('Logout')
    end

    context 'Successful' do
      xit 'Will log the User out' do
        click_link 'Logout'
        expect(current_path).to eq(root_path)
      end

      xit 'Flash message shows logout' do
        click_link 'Logout'
        expect(page).to have_content('Logout successful')
      end
    end
  end
end
