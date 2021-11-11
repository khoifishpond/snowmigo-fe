require 'rails_helper'

describe 'user info edit page', :vcr do
  describe 'edits' do
    before :each do
      login_with_oauth
      visit edit_user_path(10)
    end

    it 'can edit a user' do
      user = UserFacade.user_get(10)

      expect(user.name).to eq('Freddie Mercury')
      expect(user.ski_pass).to eq('Epic')
      expect(user.exp_level).to eq('Advanced')

      visit edit_user_path(10)

      expect(page).to have_field(:name, with: 'Freddie Mercury')
      expect(page).to have_field(:ski_pass, with: 'Epic')
      expect(page).to have_field(:exp_level, with: 'Advanced')

      fill_in :name, with: 'Squirrely Dan'
      select 'Ikon', from: :ski_pass
      select 'Expert', from: :exp_level
      click_button 'Update Info'

      user = UserFacade.user_get(10)

      expect(user.name).to eq('Squirrely Dan')
      expect(user.ski_pass).to eq('Ikon')
      expect(user.exp_level).to eq('Expert')
      expect(current_path).to eq(user_path(user.id))
      expect(page).to have_content('Squirrely Dan')
      expect(page).to have_content('Ikon')

      visit edit_user_path(7)

      fill_in :name, with: 'Freddie Mercury'
      select 'Epic', from: :ski_pass
      select 'Advanced', from: :exp_level
      click_button 'Update Info'
    end
  end
end
