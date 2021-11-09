require 'rails_helper'

describe 'edit page', :vcr do
  it 'can update a trip' do
    trip = TripFacade.trip_get(113)
    visit edit_trip_path(trip.id)

    expect(page).to have_field(:name, with: trip.name.to_s)
    expect(page).to have_field(:start_date, with: trip.start_date.to_s)
    expect(page).to have_field(:end_date, with: trip.end_date.to_s)

    fill_in :name, with: 'Cool Trip Name'
    click_button 'Edit trip!'

    expect(current_path).to eq(trip_path(trip.id))
    expect(page).to have_content('Cool Trip Name')
  end
end
