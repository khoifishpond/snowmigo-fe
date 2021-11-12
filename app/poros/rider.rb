class Rider
  attr_reader :id, :name, :host, :driver, :budget, :vote

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @host = data[:attributes][:host]
    @driver = data[:attributes][:driver]
    @budget = data[:attributes][:budget]
    @vote = data[:attributes][:vote]
  end
end
