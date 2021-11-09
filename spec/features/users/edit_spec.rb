require 'rails_helper'

describe 'user info edit page', :vcr do
  describe 'edits' do
    before :each do
      login_with_oauth
      visit edit_user_path(5)
    end

    it 'can edit a user' do
      user = UserFacade.user_get(5)

      expect(user.name).to eq('Freddie Mercury')
      expect(user.ski_pass).to eq('Ikon')
      expect(user.exp_level).to eq('Expert')
      expect(page).to have_field(:name, with: 'Freddie Mercury')
      expect(page).to have_field(:ski_pass, with: 'Ikon')
      expect(page).to have_field(:exp_level, with: 'Expert')

      fill_in :name, with: 'Squirrely Dan'
      select 'Epic', from: :ski_pass
      click_button 'Update Info'

      expect(current_path).to eq(user_path(user.id))
      expect(page).to have_content('Squirrely Dan')
      expect(page).to have_content('Epic')
    end
  end
end

# save_and_open_page
