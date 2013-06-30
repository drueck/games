Games::Application.routes.draw do

  devise_for :users

  root 'home#index'

  resources :my_games, only: [:index, :create, :destroy], path: :games

end
