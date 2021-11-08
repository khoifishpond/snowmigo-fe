require 'rails_helper'

RSpec.describe ResortService do
  it '#resorts_by_state', :vcr do
    resorts = ResortService.resorts_by_state('co')
    expect(resorts).to be_a Hash
    expect(resorts[:data]).to be_an Array
    resorts[:data].each do |resort|
      expect(resort).to be_a(Hash)
      expect(resort).to have_key(:type)
      expect(resort[:type]).to be_a(String)

      expect(resort).to have_key(:id)
      expect(resort[:id]).to be_a(String)

      expect(resort).to have_key(:attributes)
      expect(resort[:attributes]).to be_a(Hash)
      expect(resort[:attributes]).to have_key(:name)
      expect(resort[:attributes][:name]).to be_a(String)
    end
  end

  it '#resort_by_id', :vcr do
    resort = ResortService.resort_by_id('303001')
    expect(resort).to be_a(Hash)
    expect(resort).to have_key(:data)

    resort_data = resort[:data].first
    expect(resort_data).to have_key(:id)
    expect(resort_data[:id]).to be_a(String)
    expect(resort_data).to have_key(:type)
    expect(resort_data[:type]).to be_a(String)
    expect(resort_data).to have_key(:attributes)
    expect(resort_data[:attributes]).to be_a(Hash)

    resort_attr = resort_data[:attributes]
    expect(resort_attr).to have_key(:name)
    expect(resort_attr[:name]).to be_a(String)
    expect(resort_attr).to have_key(:new_snow)
    expect(resort_attr[:new_snow]).to be_a(String)
    expect(resort_attr).to have_key(:base_depth)
    expect(resort_attr[:base_depth]).to be_a(String)
    expect(resort_attr).to have_key(:open_lifts)
    expect(resort_attr[:open_lifts]).to be_a(String)
    expect(resort_attr).to have_key(:open_trails)
    expect(resort_attr[:open_trails]).to be_a(String)
    expect(resort_attr).to have_key(:snow_condition)
    expect(resort_attr[:snow_condition]).to be_a(String)
    expect(resort_attr).to have_key(:mask_required)
    expect(resort_attr[:mask_required]).to be_a(String)
    expect(resort_attr).to have_key(:trail_map)
    expect(resort_attr[:trail_map]).to be_a(String)
    expect(resort_attr).to have_key(:logo)
    expect(resort_attr[:logo]).to be_a(String)
    expect(resort_attr).to have_key(:chance_of_snow)
    expect(resort_attr[:chance_of_snow]).to be_a(String)
    expect(resort_attr).to have_key(:hourly_weather)
    expect(resort_attr[:hourly_weather]).to be_a(Hash)

    resort_weather = resort_attr[:hourly_weather]
    expect(resort_weather).to have_key(:morning)
    expect(resort_weather[:morning]).to be_a(Hash)
    expect(resort_weather[:morning]).to have_key(:temp)
    expect(resort_weather[:morning][:temp]).to be_a(String)
    expect(resort_weather[:morning]).to have_key(:weather)
    expect(resort_weather[:morning][:weather]).to be_a(String)
    expect(resort_weather[:morning]).to have_key(:weather_icon)
    expect(resort_weather[:morning][:weather_icon]).to be_a(String)
    expect(resort_weather[:morning]).to have_key(:wind)
    expect(resort_weather[:morning][:wind]).to be_a(String)
    expect(resort_weather[:morning]).to have_key(:snowfall)
    # expect(resort_weather[:morning][:snowfall]).to be_a(String)

    expect(resort_weather).to have_key(:noon)
    expect(resort_weather[:noon]).to be_a(Hash)
    expect(resort_weather[:noon]).to have_key(:temp)
    expect(resort_weather[:noon][:temp]).to be_a(String)
    expect(resort_weather[:noon]).to have_key(:weather)
    expect(resort_weather[:noon][:weather]).to be_a(String)
    expect(resort_weather[:noon]).to have_key(:weather_icon)
    expect(resort_weather[:noon][:weather_icon]).to be_a(String)
    expect(resort_weather[:noon]).to have_key(:wind)
    expect(resort_weather[:noon][:wind]).to be_a(String)
    expect(resort_weather[:noon]).to have_key(:snowfall)
    # expect(resort_weather[:noon][:snowfall]).to be_a(String)

    expect(resort_weather).to have_key(:afternoon)
    expect(resort_weather[:afternoon]).to be_a(Hash)
    expect(resort_weather[:afternoon]).to have_key(:temp)
    expect(resort_weather[:afternoon][:temp]).to be_a(String)
    expect(resort_weather[:afternoon]).to have_key(:weather)
    expect(resort_weather[:afternoon][:weather]).to be_a(String)
    expect(resort_weather[:afternoon]).to have_key(:weather_icon)
    expect(resort_weather[:afternoon][:weather_icon]).to be_a(String)
    expect(resort_weather[:afternoon]).to have_key(:wind)
    expect(resort_weather[:afternoon][:wind]).to be_a(String)
    expect(resort_weather[:afternoon]).to have_key(:snowfall)
    # expect(resort_weather[:afternoon][:snowfall]).to be_a(String)
  end
end
