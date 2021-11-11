require 'rails_helper'

RSpec.describe 'New trip', :vcr do
  describe 'creating a trip' do
    it 'creates a trip' do
      login_with_oauth
      visit new_trip_path
      fill_in :start_date, with: '12/12/2021'
      fill_in :end_date, with: '14/12/2021'
      fill_in :name, with: 'Happy fun time'
      click_on 'Create trip!'

      expect(page).to have_content('Dec 12, 2021')
      expect(page).to have_content('Dec 14, 2021')
      expect(page).to have_content('Happy fun time')
    end
  end
end
