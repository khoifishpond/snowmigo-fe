require 'rails_helper'

describe 'user info edit page', :vcr do
  describe 'edits' do
    before :each do
      login_with_oauth
      visit edit_user_path(2)
    end

    it 'can edit a user' do
      select 'Epic', from: :ski_pass
      click_button 'Update Info'

      user = UserFacade.user_get(2)
      visit edit_user_path(2)

      expect(user.name).to eq('Freddie Mercury')
      expect(user.ski_pass).to eq('Epic')
      expect(user.exp_level).to eq('Advanced')

      visit edit_user_path(2)

      expect(page).to have_field(:name, with: 'Freddie Mercury')
      expect(page).to have_field(:ski_pass, with: 'Epic')
      expect(page).to have_field(:exp_level, with: 'Advanced')

      select 'Epic', from: :ski_pass
      click_button 'Update Info'

      user = UserFacade.user_get(2)

      expect(user.ski_pass).to eq('Epic')
      expect(current_path).to eq(user_path(user.id))
      expect(page).to have_content('Epic')
    end
  end
end
