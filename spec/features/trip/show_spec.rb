require 'rails_helper'

RSpec.describe 'trip show page', :vcr do
  describe 'has trip info' do
    let(:trip) { Trip.new({ id: 47, attributes: { name: 'Happy fun time', start_date: '08/11/2021', end_date: '25/11/2021', resort_id: 2 } }) }
    it 'shows trip info' do
      visit trip_path(trip.id)
      expect(page).to have_content('Nov 8, 2021')
      expect(page).to have_content('Nov 25, 2021')
    end
  end
end
