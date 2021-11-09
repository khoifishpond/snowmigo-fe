require 'rails_helper'

RSpec.describe 'trip show page' do
  describe 'has trip info', :vcr do
    let(:trip) do
      Trip.new({ id: 47,
                 attributes: { name: 'Happy fun time', start_date: '08/11/2021', end_date: '25/11/2021',
                               resort_id: 2 } })
    end
    it 'shows trip info' do
      visit trip_path(trip.id)
      expect(page).to have_content('Nov 8, 2021')
      expect(page).to have_content('Nov 25, 2021')
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
