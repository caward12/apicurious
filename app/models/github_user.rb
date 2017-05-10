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
    Starred.starred(token).map do |user|
      GithubUser.new(user, token)
    end
  end

  def followers(token)
    Followers.followers(token).map do |user|
      GithubUser.new(user, token)
    end
  end

  def following(token)
    Following.following(token).map do |user|
      GithubUser.new(user, token)
    end
  end


end