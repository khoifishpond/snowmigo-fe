require 'rails_helper'

RSpec.describe ResortFacade do
  it '#resorts_by_state', :vcr do
    resorts = ResortFacade.resorts_by_state('co')
    expect(resorts).to be_an(Array)
    expect(resorts.count).to eq(35)
    expect(resorts.first).to be_a(Resort)
  end

  it '#resort_by_id', :vcr do
    resort = ResortFacade.resort_by_id('303001')
    expect(resort).to be_a(Resort)
  end
end
