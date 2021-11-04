class UserClient
  class << self
    def fetch(endpoint)
      parse_data(conn.get(endpoint))
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new('http://localhost:3000')
    end
  end
end
