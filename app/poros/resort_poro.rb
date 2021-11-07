class ResortPoro
  attr_reader :id, :name
  def initialize(response)
    @id = response[:id]
    @name = response[:attributes][:name]
  end
end
