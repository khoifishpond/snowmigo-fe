require 'rails_helper'

RSpec.describe ResortPoro do
  before(:each) do
    data = {id: "1",
            type: 'state_resort',
            attributes: {
              name: 'Arapahoe Basin'
              }}
    @resort = ResortPoro.new(data)
  end

  it 'exists and has attributes' do
    expect(@resort.name).to eq('Arapahoe Basin')
    expect(@resort.id).to eq("1")
  end
end
