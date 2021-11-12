require 'rails_helper'

RSpec.describe 'Welcome page' do
  describe 'As a visitor' do
    before { visit root_path }

    it 'displays Welcome text and button' do
      expect(page).to have_content('Welcome to Snowmigo!')
      expect(page).to have_link('Login with Google')
    end

    it 'login redirects to user dashboard', :vcr do
      click_on 'Login with Google'
      expect(page).to have_content('Welcome Freddie Mercury')
    end
  end
end
