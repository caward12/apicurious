class GithubService
  def initialize
    @_connection = Faraday.new("https://api.github.com/")
  end

  def search_user(token)
    response = connection.get "/user?access_token=#{token}"

    JSON.parse(response.body, symbolize_names: true)
  end


  def self.search_user(token)
    service = GithubService.new
    service.search_user(token)
  end

  private

  def connection
    @_connection
  end
end