class Followers

  def self.followers(token)
    GithubService.new(token).followers
  end
end