class ResortPoro
  attr_reader :id, :name, :new_snow, :base_depth, :open_trails, :open_lifts,
  :snow_condition, :chance_of_snow, :mask_required, :trail_map, :logo,
  :morning_weather, :noon_weather, :afternoon_weather
  def initialize(response)
    @id = response[:id]
    @name = response[:attributes][:name]
    @new_snow = response[:attributes][:new_snow]
    @base_depth = response[:attributes][:base_depth]
    @open_trails = response[:attributes][:open_trails]
    @open_lifts = response[:attributes][:open_lifts]
    @snow_condition = response[:attributes][:snow_condition]
    @mask_required = mask(response[:attributes][:mask_required])
    @trail_map = response[:attributes][:trail_map]
    @logo = response[:attributes][:logo]
    @chance_of_snow = response[:attributes][:chance_of_snow]
    @morning_weather = response[:attributes][:hourly_weather][:morning]
    @noon_weather = response[:attributes][:hourly_weather][:noon]
    @afternoon_weather = response[:attributes][:hourly_weather][:afternoon]
  end

  def mask(enum)
    if enum == '0'
      'No'
    else
      'Yes'
    end
  end
end
