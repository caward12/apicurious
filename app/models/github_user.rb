class GithubUser

  attr_reader :attrs

  def initialize(attrs={})
    @attrs = attrs
  end

  def nickname
    @attrs[:login]
  end

  def self.search_user(token, nickname)
    user = GithubService.new(token).search_user(nickname)
    new(user)
  end

  def avatar_url
    attrs[:avatar_url]
  end

  def starred(token, nickname)
    GithubService.new(token).starred(nickname)
  end

  def followers(token, nickname)
    GithubService.new(token).followers(nickname).map do |user|
      user[:login]
    end
  end


end