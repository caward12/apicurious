class GithubService
  def initialize(token)
    @_token_param = {access_token: token}
    @token = token
    @_connection = Faraday.new("https://api.github.com/")
  end

  def starred
    parser(connection.get("/user/starred", token_param))
  end

  def search_user
    parser(connection.get("/user", token_param))
  end

  def followers
    parser(connection.get("/user/followers", token_param))
  end

  def following
    parser(connection.get("/user/following", token_param))
  end

  def repos
    parser(connection.get "/user/repos?access_token=#{@token}&per_page=100")
  end

  def organizations
    parser(connection.get("/user/orgs", token_param))
  end

  def events(nickname)
    parser(connection.get("/users/#{nickname}/events", token_param))
  end

  def notifications
    parser(connection.get("/notifications", token_param))
  end

  private

  def connection
    @_connection
  end

  def token_param
    @_token_param
  end

  def parser(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end