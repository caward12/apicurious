class Dashboard::FollowersController < ApplicationController

  def index
    @user = GithubUser.search_user(current_user.oauth_token)
  end

end