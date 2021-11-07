require 'rails_helper'

RSpec.describe ResortFacade do
  it '#resorts_by_state', :vcr do
    resorts = ResortFacade.resorts_by_state('co')
    expect(resorts).to be_an(Array)
    expect(resorts.first).to be_a(ResortPoro)
    #add array.count expectation
  end
end
