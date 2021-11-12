require 'rails_helper'

RSpec.describe 'resorts index page', :vcr do
  before(:each) do
    login_with_oauth
    visit resorts_path
  end

  it 'has dropdown search by state' do
    within('#resorts-search') do
      expect(page).to have_select('state', with_options: states)
      expect(page).to have_button('Search')
    end
  end

  it 'returns resorts links within selected state' do # vcr
    within('#resorts-search') do
      select 'Colorado', from: 'state'
      click_on 'Search'
    end
    expect(current_path).to eq(resorts_path)
    within('#resorts') do
      expect(page).to have_link('Arapahoe Basin')
      click_on 'Arapahoe Basin'
    end
    expect(current_path).to eq(resort_path('303001'))
  end
end
