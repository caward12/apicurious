class Organization

  attr_reader :attrs

  def initialize(attrs={})
    @attrs = attrs
  end

  def self.organizations(token)
    GithubService.new(token).organizations.map do |org|
      new(org)
    end
  end
end