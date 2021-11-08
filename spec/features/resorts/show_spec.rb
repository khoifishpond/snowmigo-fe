require 'rails_helper'

RSpec.describe 'resort show page' do
  before(:each) do
    @resort_id = "303001"
    login_with_oauth
    visit resort_path(@resort_id)
  end

  it 'displays resort attributes', :vcr do
    expect(page).to have_css("img[alt*='Arapahoe Basin']")
    expect(page).to have_content("Arapahoe Basin")
    expect(page).to have_content("Mask Requirements: Yes")
    expect(page).to have_content("Snow Conditions")
    within("##{@resort_id}-snow") do
      expect(page).to have_content('New Snow:')
      expect(page).to have_content('Base Depth: 19 in')
      expect(page).to have_content('Snow Condition: Machine Groomed')
    end
    expect(page).to have_content("Resort Features")
    within("##{@resort_id}-features") do
      expect(page).to have_content('Open Lifts: 1/9')
      expect(page).to have_content('Open Trails: 1/147')
      expect(page).to have_link('Trail Map')
    end
    expect(page).to have_content("Today's Weather")
    within("##{@resort_id}-weather") do
      expect(page).to have_content('Morning:')
      within('#morning-weather') do
        expect(page).to have_css("img[alt*='Sunny']")
        expect(page).to have_content("Snowfall:")
        expect(page).to have_content("Temperature: 34 Fahrenheit")
        expect(page).to have_content("Wind: 19 mph")
      end
      expect(page).to have_content('Noon:')
      within('#noon-weather') do
        expect(page).to have_css("img[alt*='Partly cloudy']")
        expect(page).to have_content("Snowfall:")
        expect(page).to have_content("Temperature: 37 Fahrenheit")
        expect(page).to have_content("Wind: 23 mph")
      end
      expect(page).to have_content('Afternoon:')
      within('#afternoon-weather') do
        expect(page).to have_css("img[alt*='Partly cloudy']")
        expect(page).to have_content("Snowfall:")
        expect(page).to have_content("Temperature: 35 Fahrenheit")
        expect(page).to have_content("Wind: 23 mph")
      end
    end
  end
end
