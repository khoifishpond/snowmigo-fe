require 'rails_helper'

RSpec.describe ResortPoro do
  before(:each) do
    data = {id: "1",
            type: 'state_resort',
            attributes: {
              name: 'Arapahoe Basin',
              new_snow: '3',
              base_depth: '21',
              open_trails: '1/147',
              open_lifts: '1/9',
              snow_condition: 'Machine Groomed',
              mask_required: '1',
              trail_map: 'http://feeds.snocountry.net/trailmapDisplay.php?permcode=303001',
              logo: 'http://snocountry.com/ski_area_logos/303001logo.jpg',
              chance_of_snow: '0',
              hourly_weather: {
                morning: {
                  temp: '38',
                  weather: 'Sunny',
                  weather_icon: 'http://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png',
                  wind: '17',
                  snowfall: 'null'
                },
                noon: {
                  temp: '41',
                  weather: 'Sunny',
                  weather_icon: 'http://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png',
                  wind: '27',
                  snowfall: 'null'
                },
                afternoon: {
                  temp: '38',
                  weather: 'Sunny',
                  wind: '18',
                  snowfall: 'null'
                }
              }
              }}
    @resort = ResortPoro.new(data)
  end

  it 'exists and has attributes' do
    morning_weather = {
      temp: '38',
      weather: 'Sunny',
      weather_icon: 'http://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png',
      wind: '17',
      snowfall: 'null'
      }
    noon_weather = {
      temp: '41',
      weather: 'Sunny',
      weather_icon: 'http://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png',
      wind: '27',
      snowfall: 'null'
      }
    afternoon_weather = {
      temp: '38',
      weather: 'Sunny',
      wind: '18',
      snowfall: 'null'
      }
    expect(@resort.name).to eq('Arapahoe Basin')
    expect(@resort.id).to eq("1")
    expect(@resort.new_snow).to eq('3')
    expect(@resort.base_depth).to eq('21')
    expect(@resort.open_trails).to eq('1/147')
    expect(@resort.open_lifts).to eq('1/9')
    expect(@resort.snow_condition).to eq('Machine Groomed')
    expect(@resort.mask_required).to eq('Yes')
    expect(@resort.trail_map).to eq('http://feeds.snocountry.net/trailmapDisplay.php?permcode=303001')
    expect(@resort.logo).to eq('http://snocountry.com/ski_area_logos/303001logo.jpg')
    expect(@resort.chance_of_snow).to eq('0')
    expect(@resort.morning_weather).to eq(morning_weather)
    expect(@resort.noon_weather).to eq(noon_weather)
    expect(@resort.afternoon_weather).to eq(afternoon_weather)
  end
end
