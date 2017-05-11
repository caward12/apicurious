class Dashboard::ReposController < ApplicationController

  def index
    @user = GithubUser.search_user(current_user.oauth_token)
  end

  def new
  end

  def create
    Repo.create_repo(current_user.oauth_token, params[:name])
    redirect_to dashboard_repos_path
  end
end