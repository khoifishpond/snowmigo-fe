class Friend
  attr_reader :name, :id, :friend_id

  def initialize(params)
    @id = params[:id]
    @name = params[:name]
    @friend_id = params[:friend_id]
  end
end
