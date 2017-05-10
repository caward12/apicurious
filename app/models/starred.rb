class Starred

  def self.starred(token)
    GithubService.new(token).starred
  end
end