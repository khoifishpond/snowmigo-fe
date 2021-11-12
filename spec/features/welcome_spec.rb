require 'rails_helper'

RSpec.describe 'Welcome page' do
  describe 'As a visitor' do
    before { visit root_path }

    it 'displays Welcome text and button' do
      expect(page).to have_link('Login with Google')
    end
  end
end
