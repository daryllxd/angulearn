require 'resque/server'

Angulearn::Application.routes.draw do
  resources :articles
  root to: "home#index"
  mount Resque::Server.new, at: "/resque"
  devise_for :users
end
