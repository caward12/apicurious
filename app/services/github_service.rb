class GithubService
  def initialize(token)
    @token = token
    @_connection = Faraday.new("https://api.github.com/")
  end

  def starred(nickname)
    response = connection.get "/users/#{nickname}/starred?access_token#{@token}"
    parser(response)
  end

  def search_user(nickname)
    response = connection.get "/users/#{nickname}?access_token=#{@token}"
    parser(response)
  end


  private

  def connection
    @_connection
  end

  def parser(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end