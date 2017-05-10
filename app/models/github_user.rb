class GithubUser

  attr_reader :attrs, :token

  def initialize(attrs={}, token)
    @attrs = attrs
    @token = token
  end

  def nickname
    @attrs[:login]
  end

  def self.search_user(token)
    user = GithubService.new(token).search_user
    new(user, token)
  end

  def avatar_url
    attrs[:avatar_url]
  end

  def starred(token)
    Repo.starred(token)
  end

  def followers(token)
    GithubService.new(token).followers.map do |user|
      GithubUser.new(user, token)
    end
  end

  def following(token)
    GithubService.new(token).following.map do |user|
      GithubUser.new(user, token)
    end
  end

  def repos(token)
    Repo.repos(token)
  end


end