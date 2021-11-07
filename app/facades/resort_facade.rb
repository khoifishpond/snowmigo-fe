class ResortFacade
  class << self
    def resorts_by_state(state)
      resorts = ResortService.resorts_by_state(state)
      resorts[:data].map do |resort|
        ResortPoro.new(resort)
      end
    end
  end
end
