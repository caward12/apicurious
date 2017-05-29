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

  def updated_at
    attrs[:updated_at]
  end

  def owner
    attrs[:owner][:login]
  end

  def self.user_repos(token, nickname)
    GithubService.new(token).repos.select do |repo|
      repo[:owner][:html_url].split(/\W+/).last == nickname
    end
  end

  def self.all_repos(token)
    GithubService.new(token).repos.map do |repo|
      new(repo)
    end
  end

  def self.sorted_repos_date(token, nickname)
    user_repos(token, nickname).sort_by {|repo| repo[:updated_at]}.reverse
  end

  def self.repos(token, nickname)
    sorted_repos_date(token, nickname).map do |repo|
      new(repo)
    end
  end

  def self.starred(token)
    GithubService.new(token).starred.map do |repo|
      new(repo)
    end
  end

  def self.create_repo(token, name)
    GithubService.new(token).create_repo(name)
  end
end