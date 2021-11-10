require 'rails_helper'

RSpec.describe 'trip show page' do
  describe 'has trip info', :vcr do
    before :each do
      login_with_oauth
      trip_params = {
        name: 'Happy fun time', start_date: '08/11/2021', end_date: '25/11/2021'
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
      save_and_open_page
      expect(current_path).to eq(trip_path(@trip.id))
      within("#option-303001") do
        expect(page).to have_content('Arapahoe Basin')
      end
    end
  end

  describe '#destroy' do
    it 'can delete a trip' do
      login_with_oauth
      trip = TripFacade.create_trip(name: 'Delete Trip', start_date: '08/11/2021', end_date: '25/11/2021')
      visit trip_path(trip.id)

      click_link 'Delete trip'

      expect(current_path).to eq(user_path(5))
    end
  end
end
