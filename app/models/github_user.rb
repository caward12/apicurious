class GithubUser

  attr_reader :attrs

  def initialize(attrs={})
    @attrs = attrs
  end

  def nickname
    @attrs[:login]
  end

  def self.search_user(token)
    user = GithubService.new(token).search_user
    new(user)
  end

  def avatar_url
    attrs[:avatar_url]
  end

  def starred(token)
    GithubService.new(token).starred
  end

  def followers(token)
    GithubService.new(token).followers.map do |user|
      user[:login]
    end
  end


end