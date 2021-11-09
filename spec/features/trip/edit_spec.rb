require 'rails_helper'

describe 'edit page', :vcr do

  before :each do
    @trip = TripFacade.trip_get(47)
    visit edit_trip_path(@trip.id)
  end

  it 'shows trip on edit page' do
    expect(page).to have_field(:name, with: "#{@trip.name}")
    expect(page).to have_field(:start_date, with: "#{@trip.start_date}")
    expect(page).to have_field(:end_date, with: "#{@trip.end_date}")
  end
end
