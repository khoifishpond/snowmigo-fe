require 'rails_helper'

RSpec.describe 'resort show page' do
  before(:each) do
    @resort_id = '303001'
    login_with_oauth
    visit resort_path(@resort_id)
  end

  it 'displays resort attributes', :vcr do
    expect(page).to have_css("img[alt*='Arapahoe Basin']")
    expect(page).to have_content('Arapahoe Basin')
    expect(page).to have_content('Mask Required: Yes')
    expect(page).to have_content('Snow Conditions')
    within("##{@resort_id}-snow") do
      expect(page).to have_content('New Snow:')
      expect(page).to have_content('Snow Conditions New Snow:4 in Base Depth: 21 in')
      expect(page).to have_content('Snow Condition: Powder')
    end
    expect(page).to have_content('Resort Features')
    within("##{@resort_id}-features") do
      expect(page).to have_content('Open Lifts: 2/9')
      expect(page).to have_content('Open Trails: 3/147')
      expect(page).to have_link('Trail Map')
    end
    expect(page).to have_content("Today's Forecast")
    within("##{@resort_id}-weather") do
      expect(page).to have_content('Morning')
      within('#morning-weather') do
        expect(page).to have_css("img[alt*='Patchy moderate snow']")
        expect(page).to have_content('17 Fahrenheit')
        expect(page).to have_content('29 mph')
      end
      within('#noon-weather') do
        expect(page).to have_css("img[alt*='Partly cloudy']")
        expect(page).to have_content('20 Fahrenheit')
        expect(page).to have_content('32 mph')
      end
      within('#afternoon-weather') do
        expect(page).to have_css("img[alt*='Patchy light snow']")
        expect(page).to have_content('20 Fahrenheit')
        expect(page).to have_content('24 mph')
      end
    end
  end
end
