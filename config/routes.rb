Rails.application.routes.draw do

root 'home#index'

get '/auth/github', as: :github_login
get '/auth/github/callback', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'


get '/dashboard', to: 'dashboard#index'

namespace :dashboard do
  resources :repos, only: [:index, :new, :create]
  get '/following', to: 'following#index'
  get '/starred', to: 'starred#index'
  get '/followers', to: 'followers#index'
end

end
