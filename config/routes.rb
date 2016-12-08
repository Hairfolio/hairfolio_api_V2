require 'api_constraints'
Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      root to: 'home#index', as: 'api_home'
      resources :brands, only: [:index, :show]
      resources :services, only: [:index, :show]
      resources :tags, only: [:index]
      resources :categories, only: [:index]
      resources :certificates, only: [:index, :show]
      resources :products, only: [:index]
      resources :degrees, only: [:index, :show]
      resources :lines, only: [:index, :show]
      resources :harmonies, only: [:index]
      resources :experiences, only: [:index]
      resources :contacts, except: [:edit]
      resources :folios, only: [:index, :create, :destroy, :update]
      resources :posts do
        resources :likes, only: [:create, :index] do
          collection { delete :destroy }
        end
      end
      resources :users, except: [:edit] do
        resources :follows, only: [:create, :destroy, :index]
        resources :notifications, only: [:index, :destroy]
      end
      resources :conversations, except: [:edit] do
        resources :messages, except: [:edit]
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
