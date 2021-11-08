require 'rails_helper'

RSpec.describe 'welcome page' do
  before(:each) do
    visit root_path
  end
  it 'has welcome page' do
    expect(page).to have_content("Welcome to Snowmigo!")
    expect(page).to have_button("Login with Google")
  end

  xit 'login redirects to user dashboard', :vcr do
    click_on 'Login with Google'
    expect(page).to have_content("Welcome Freddie Mercury")
  end
end
