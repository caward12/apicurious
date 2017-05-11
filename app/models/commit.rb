class Commit

  attr_reader :attrs, :repo

  def initialize(attrs={}, repo)
    @attrs = attrs
    @repo = repo
  end

  def message
    attrs[:message]
  end

  def self.commits(payload, repo)
    payload[:commits].map do |commit|
      new(commit, repo)
    end.first
  end

end