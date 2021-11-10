require 'rails_helper'

RSpec.describe 'New trip', :vcr do
  describe 'creating a trip' do
    let(:trip) do
      Trip.new({ id: 315,
                 attributes: { name: 'Happy fun time',
                               start_date: '12/12/2021',
                               end_date: '14/12/2021',
                               resort_id: 2,
                               user_id: 19 } })
    end

    it 'creates a trip' do
      login_with_oauth
      visit new_trip_path
      fill_in :start_date, with: '12/12/2021'
      fill_in :end_date, with: '14/12/2021'
      fill_in :name, with: 'Happy fun time'
      click_on 'Create trip!'

      expect(current_path).to eq(trip_path(trip.id))
    end
  end
end
