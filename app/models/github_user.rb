class GithubUser

  attr_reader :avatar_url

  def initialize(attrs={})
    @avatar_url = attrs[:avatar_url]
  end

  def self.search_user(token)
    user = GithubService.search_user(token)
    new(user)
  end


end