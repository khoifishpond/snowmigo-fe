require 'rails_helper'

RSpec.describe TripFacade, :vcr do
  describe 'trip creation' do
    it 'creates a trip' do
      result = TripFacade.create_trip({ name: 'Happy fun time', start_date: '11/11/1111', end_date: '22/22/2222', resort_id: 2 })
      expect(result).to be_a(TripPoro)
    end
  end
end
