class Event

  attr_reader :attrs

  def initialize(attrs={})
    @attrs = attrs
  end

  def type
    attrs[:type]
  end

  def payload
    attrs[:payload]
  end

  def repo
    attrs[:repo][:name].split('/').last
  end

  def self.recent_commits(nickname, token)
    push_events(nickname, token).map do |event|
      Commit.commits(event.payload, event.repo)
    end
  end

  def self.push_events(nickname, token)
    events(nickname, token).select do |event|
      event.type == "PushEvent"
    end
  end


  def self.events(nickname, token)
    GithubService.new(token).events(nickname).map do |event|
      new(event)
    end
  end

end