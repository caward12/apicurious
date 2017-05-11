class Repo

  attr_reader :attrs

  def initialize(attrs={})
    @attrs = attrs
  end

  def name
    attrs[:name]
  end

  def description
    attrs[:description]
  end

  def language
    attrs[:language]
  end

  def self.user_repos(token)
    GithubService.new(token).repos.select do |repo|
      repo[:owner][:html_url].split(/\W+/).last == "caward12"
    end
  end

  def self.all_repos(token)
    GithubService.new(token).repos.map do |repo|
      new(repo)
    end
  end

  def self.repos(token)
    user_repos(token).map do |repo|
      new(repo)
    end
  end

  def self.starred(token)
    GithubService.new(token).starred.map do |repo|
      new(repo)
    end
  end
end