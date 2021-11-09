class ResortFacade
  class << self
    def resorts_by_state(state)
      resorts = ResortService.resorts_by_state(state)
      resorts[:data].map do |resort|
        Resort.new(resort)
      end
    end

    def resort_by_id(id)
      resort = ResortService.resort_by_id(id)
      Resort.new(resort[:data].first)
    end
  end
end
