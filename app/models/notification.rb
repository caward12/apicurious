class Notification

  attr_reader :attrs

  def initialize(attrs={})
    @attrs = attrs
  end


  def reason
    attrs[:reason]
  end

  def repo
    attrs[:repository][:name]
  end

  def owner
    attrs[:repository][:owner][:login]
  end

  def date
    attrs[:updated_at].to_date
  end

  def self.mentions(token)
    notifications(token).select do |notification|
      notification.reason == 'mention'
    end
  end

  def self.notifications(token)
    GithubService.new(token).notifications.map do |notificaiton|
      new(notificaiton)
    end
  end

end