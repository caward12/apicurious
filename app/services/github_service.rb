class GithubService
  def initialize(token)
    @token = token
    @_connection = Faraday.new("https://api.github.com/")
  end

  def starred
    parser(connection.get "/user/starred?access_token=#{@token}")
  end

  def search_user
    parser(connection.get "/user?access_token=#{@token}")
  end

  def followers
    parser(connection.get "/user/followers?access_token=#{@token}")
  end

  def following
    parser(connection.get "/user/following?access_token=#{@token}")
  end

  def repos
    parser(connection.get "/user/repos?access_token=#{@token}")
  end


  private

  def connection
    @_connection
  end

  def parser(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end