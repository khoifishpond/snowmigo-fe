require 'rails_helper'

RSpec.describe 'welcome page' do
  before(:each) do
    visit root_path
  end
  it 'has welcome page' do
    expect(page).to have_content("Welcome to Snowmigo!")
    expect(page).to have_button("Login with Google")
  end

  it 'login redirects to user dashboard', :vcr do
    click_on 'Login with Google'
    expect(current_path).to eq(user_path("5"))
  end
end
