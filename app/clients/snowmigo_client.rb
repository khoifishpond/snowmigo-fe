class SnowmigoClient
  class << self
    def fetch(endpoint)
      parse_data(conn.get(endpoint))
    end

    def post_data(endpoint, attribute_hash)
      attribute_json = attribute_hash.to_json
      parse_data(conn.post(endpoint, attribute_json, "Content-Type" => "application/json"))
    end

    def patch_data(endpoint, attribute_hash)
      attribute_json = attribute_hash.to_json
      parse_data(conn.patch(endpoint, attribute_json, "Content-Type" => "application/json"))
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new('http://snowmigo-be.herokuapp.com')
    end
  end
end
