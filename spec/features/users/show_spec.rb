require 'rails_helper'

RSpec.describe 'User Dashboard', :vcr do
  # describe 'Requires a user' do
  #   # for when we use our require user method
  # #   it 'redirects if no user' do
  # #     visit user_path
  # #
  # #     expect(current_path).to eq(root_path)
  # #     expect(page).to have_content('Please login to access your account')
  # #   end
  # end

  describe 'As a verified User' do
    describe 'With Successful Login' do
      before do
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
            emergency_number: nil,
            trips: [],
            friendship: []
          }
        }
      end

      it 'Flash Message shows success' do
        expect(page).to have_content('Login Successful')
      end

      #Display Info
      it 'displays user info' do
        expect(page).to have_content(@user_attributes[:attributes][:name])
      end

      it 'has past and upcoming fields' do
        expect(page).to have_content('Past Trips')
        expect(page).to have_content('Upcoming Trips')
      end

      it 'has a button to edit user info' do
        click_on 'Edit info'

        expect(current_path).to eq(edit_user_path(@user_attributes[:id]))
      end

      it 'returns message with no Upcoming Trips' do
        expect(page).to have_content('No Upcoming Trips')
      end

      it 'returns message with no friends added' do
        expect(page).to have_content('You have not added any friends yet!')
      end

      # it 'returns Upcoming Trips' do
      #   @user_attributes[:attributes][:trips].each do |trip|
      #     expect(page).to have_content(trip[:name])
      #     expect(page).to have_content(trip[:resort_name])
      #     expect(page).to have_content(trip[:start_date])
      #     expect(page).to have_content(trip[:end_date])
      #   end
      # end

      # it 'can return User Trips' do
      #   binding.pry
      #   expect()
      # end


      describe 'Logout' do
        it 'has a logout button' do
          expect(page).to have_link('Logout')
        end

        context 'Successful' do
          before { click_link 'Logout' }

          it 'Will log the User out' do
            expect(current_path).to eq(root_path)
          end

          it 'Flash message shows logout' do
            expect(page).to have_content('Logout successful')
          end
        end
      end
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
      trips: [
        {
          id: '1',
          resort_id: 2,
          start_date: '2010-12-23',
          end_date: '2010-12-27',
          created_at: '2021-11-10T02:31:25.947Z',
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
          created_at: '2021-11-10T02:31:25.947Z',
          name: 'New Years Trip',
          resort_name: 'Keystone'
        }
      ],
      friendship: [
        {
          id: '1',
          friend_id: 4,
          user_id: 3,
          created_at: '2021-11-10T02:31:25.947Z',
          created_at: '2021-11-10T02:31:25.947Z',
        }
      ]
    }
  })
  allow(ApplicationController).receive(:current_user).and_return(@user_attributes)
  it 'has a logout button' do
    expect(page).to have_link('Logout')
  end

  context 'Successful' do
    before { click_link 'Logout' }

    it 'Will log the User out' do
      expect(current_path).to eq(root_path)
    end

    it 'Flash message shows logout' do
      expect(page).to have_content('Logout successful')
    end
  end
end
