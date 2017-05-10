class Repo

  attr_reader :attrs

  def initialize(attrs={})
    @attrs = attrs
  end

  def name
    attrs[:name]
  end

  def self.repos(token)
    GithubService.new(token).repos.map do |repo|
      new(repo)
    end
  end

  def self.starred(token)
    GithubService.new(token).starred.map do |repo|
      new(repo)
    end
  end
end