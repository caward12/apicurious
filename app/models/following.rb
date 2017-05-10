class Following

  def self.following(token)
    GithubService.new(token).following
  end
end