class DashboardController < ApplicationController

  def index
    @user = GithubUser.search_user(current_user.nickname)
  end

end