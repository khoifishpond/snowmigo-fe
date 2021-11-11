class Rider
  attr_reader :id, :name, :driver, :budget

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @driver = data[:attributes][:driver]
    @budget = data[:attributes][:budget]
  end
end
