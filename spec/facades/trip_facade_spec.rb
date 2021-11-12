require 'rails_helper'

RSpec.describe TripFacade, :vcr do
  describe 'trip creation' do
    it 'creates a trip' do
      user = UserFacade.user_get(9)
      result = TripFacade.create_trip({ "name": "Happy fun time",
                                        "start_date": "2021-11-08",
                                        "end_date": "2021-11-25",
                                        "user_id": 9 })
      expect(result).to be_a(Trip)
    end

    it 'gets a trip' do
      result = TripFacade.trip_get(7)
      expect(result).to be_a(Trip)
    end

    it 'updates a trip' do
      result = TripFacade.update_trip(7, { name: 'Happy time',
                                            start_date: '11/11/1111',
                                            end_date: '22/22/2222',
                                            resort_id: 3 })
      expect(result).to be_a(Trip)
    end
  end
end
