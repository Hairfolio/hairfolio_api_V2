require 'api_constraints'
Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      root to: 'home#index', as: 'api_home'
      resources :users, except: [:edit] do
        resources :follows, only: [:create, :destroy, :index]
        resources :notifications, only: [:index, :destroy]
      end
      resources :sessions, only: [:create, :destroy] do
        collection do
          post :facebook
          post :instagram
          post :recover
        end
      end
    end
  end
  get "/404" => "api/v1/errors#not_found"
  get "/500" => "api/v1/errors#exception"
  devise_for :users
  root to: 'home#index'
end
