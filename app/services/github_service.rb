class GithubService
  def initialize
    @_connection = Faraday.new("https://api.github.com/")
  end

  def parser(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def search_user(nickname)
    response = connection.get "/users/#{nickname}"
    parser(response)
  end

  # def self.search_user(nickname)
  #   service = GithubService.new
  #   service.search_user(nickname)
  # end

  private

  def connection
    @_connection
  end
end