require 'rails_helper'

RSpec.describe 'New trip', :vcr do
  describe 'creating a trip' do
    let(:trip) { TripPoro.new({ id: 25, attributes: { name: 'Happy fun time', start_date: '11/11/1111', end_date: '22/22/2222', resort_id: 2 } }) }
    it 'creates a trip' do
      visit new_trip_path
      fill_in :start_date, with: '12/12/2021'
      fill_in :end_date, with: '12/14/2021'
      fill_in :name, with: "Happy fun time"
      click_on 'Create trip!'

      expect(current_path).to eq(trip_path(trip.id))
    end
  end
end
