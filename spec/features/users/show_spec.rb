require 'rails_helper'

RSpec.describe 'User Dashboard', :vcr do
  describe 'Requires a user' do
    # for when we use our require user method
    # it 'redirects if no user' do
    #   visit user_path
    #
    #   expect(current_path).to eq(root_path)
    #   expect(page).to have_content('Please login to access your account')
    # end
  end

  describe 'As a verified User' do
    describe 'With Successful Login' do
      before :each do
        login_with_oauth
        @user = UserFacade.user_get(7)
      end
      # it 'Flash Message shows success' do
      #   expect(page).to have_content('Login Successful')
      # end

      it 'displays user info' do
        expect(page).to have_content(@user.name)
      end

      it 'has a button to edit user info' do
        click_on 'Edit info'

        expect(current_path).to eq(edit_user_path(@user.id))
      end

      describe 'Logout' do
        it 'has a logout button' do
          expect(page).to have_link('Logout')
        end

        context 'Successful' do
          before { click_link 'Logout' }

          it 'Will log the User out' do
            expect(current_path).to eq(root_path)
          end

          # it 'Flash message shows logout' do
          #   expect(page).to have_content('Logout successful')
          # end
        end
      end
    end
  end
end
