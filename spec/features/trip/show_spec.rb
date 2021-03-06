require 'rails_helper'

RSpec.describe 'trip show page' do
  describe 'has trip info', :vcr do
    before :each do
      login_with_oauth
      trip_params = {
        name: 'Happy fun time',
        start_date: '08/11/2021',
        end_date: '25/11/2021',
        user_id: '2'
      }
      @trip = TripFacade.create_trip(trip_params)
      visit trip_path(@trip.id)
    end

    it 'shows trip info' do
      expect(page).to have_content(@trip.name)
      expect(page).to have_content(@trip.start_date.to_date.strftime('%b %-d, %Y'))
      expect(page).to have_content(@trip.end_date.to_date.strftime('%b %-d, %Y'))
    end

    it 'can add resorts' do
      expect(page).to have_select('state', with_options: states)

      within('#resorts-search') do
        select 'Colorado', from: 'state'
        click_on 'Search'
      end

      expect(current_path).to eq(trip_path(@trip.id))

      within("#resort-303001") do
        click_on 'Add to Trip'
      end

      expect(current_path).to eq(trip_path(@trip.id))
      within("#option-303001") do
        expect(page).to have_content('Arapahoe Basin')
      end
    end

    it 'can vote on resorts' do
      within('#resorts-search') do
        select 'Colorado', from: 'state'
        click_on 'Search'
      end
      within("#resort-303001") do
      click_on 'Add to Trip'
      end

      within("#option-303001") do
        click_link 'Vote'
      end

      expect(current_path).to eq(trip_path(@trip.id))
      within("#option-303001") do
        expect(page).to have_content("Number of Votes: 1")
        expect(page).to_not have_link("Vote")
      end
    end

    it 'can add friends to trip' do
      within("#friend-11") do
        click_button 'Add'
      end

      within("#rider-11") do
        expect(page).to have_content('Greedo')
      end
    end

    it 'can delete a trip' do
      trip = TripFacade.create_trip(name: 'Delete Trip',
                                    start_date: '08/11/2021',
                                    end_date: '25/11/2021',
                                    user_id: '10')
      visit trip_path(trip.id)

      click_link 'Delete trip'

      expect(current_path).to eq(user_path(2))
    end

    it 'can close a vote' do
      within('#resorts-search') do
        select 'Colorado', from: 'state'
        click_on 'Search'
      end

      within("#resort-303001") do
        click_link 'Add to Trip'
      end

      within("#option-303001") do
        click_link 'Vote'
      end

      click_link 'Close Voting'
      expect(page).to_not have_button('Close Voting')
    end
  end
end

# save_and_open_page
