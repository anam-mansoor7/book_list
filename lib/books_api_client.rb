class BooksApiClient
  include HTTParty

  base_uri ENV.fetch 'BOOKS_API_URL'
  API_KEY = ENV.fetch 'BOOKS_API_KEY'

  ServerError = Class.new StandardError
  ClientError = Class.new StandardError

  def bestseller_list
    params = {
        'published-date' => '2018-01-07',
        'list-name' => 'hardcover-fiction',
        'api-key' => API_KEY
    }

    response = self.class.get("/lists//.json", query: params)
    case response.code
    when 200 then JSON.parse(response.body).deep_symbolize_keys[:results]
    when 400..499 then raise ClientError, response.body
    when 500..599 then raise ServerError, response.body
    else
      raise StandardError, response.body
    end
  end
end
