class Commit

  attr_reader :attrs

  def initialize(attrs={})
    @attrs = attrs
  end

  def self.commits(payload)
    payload[:commits].map do |commit|
      new(commit)
    end.first
  end

end