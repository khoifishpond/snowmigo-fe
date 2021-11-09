class Resort
  attr_reader :id, :name, :new_snow, :base_depth, :open_trails, :open_lifts,
  :snow_condition, :chance_of_snow, :mask_required, :trail_map, :logo
  def initialize(response)
    @id = response[:id]
    @name = response[:attributes][:name]
    @new_snow = no_new_snow(response[:attributes][:new_snow])
    @base_depth = response[:attributes][:base_depth]
    @open_trails = response[:attributes][:open_trails]
    @open_lifts = response[:attributes][:open_lifts]
    @snow_condition = response[:attributes][:snow_condition]
    @mask_required = mask(response[:attributes][:mask_required])
    @trail_map = response[:attributes][:trail_map]
    @logo = response[:attributes][:logo]
    @chance_of_snow = response[:attributes][:chance_of_snow]
    @hourly_weather = response[:attributes][:hourly_weather]
  end

  def mask(enum)
    if enum == '0'
      'No'
    else
      'Yes'
    end
  end

  def no_new_snow(snow)
    if snow == ''
      '0'
    else
      snow
    end
  end

  def morning_weather
    @hourly_weather[:morning]
  end

  def noon_weather
    @hourly_weather[:noon]
  end

  def afternoon_weather
    @hourly_weather[:afternoon]
  end
end
