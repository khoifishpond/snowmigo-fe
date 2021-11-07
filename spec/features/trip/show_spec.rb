require 'rails_helper'

RSpec.describe 'trip show page', :vcr do
  describe 'has trip info' do
    let(:trip) { TripPoro.new({ id: 47, attributes: { name: 'Happy fun time', start_date: '12/12/2021', end_date: '12/14/2021', resort_id: 2 } }) }
    it 'shows trip info' do
      visit trip_path(trip.id)
      expect(page).to have_content('Nov 8, 2021')
      expect(page).to have_content('Nov 25, 2021')
    end
  end
end
