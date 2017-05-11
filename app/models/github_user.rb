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
    @attrs[:avatar_url]
  end

  def starred
    Repo.starred(@token)
  end

  def followers
    GithubService.new(@token).followers.map do |user|
      GithubUser.new(user, @token)
    end
  end

  def following
    GithubService.new(@token).following.map do |user|
      GithubUser.new(user, @token)
    end
  end

  def repos
    Repo.repos(@token)
  end

  def organizations
    Organization.organizations(@token)
  end

  def events(nickname)
    Event.events(nickname, @token)
  end

  def recent_commits(nickname)
    Event.recent_commits(nickname, @token)
  end


end