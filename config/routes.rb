require 'api_constraints'
Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      root to: 'home#index', as: 'api_home'
      resources :brands, only: [:index, :show]
      resources :services, only: [:index, :show]
      resources :tags, only: [:index, :show, :create]
      resources :categories, only: [:index]
      resources :certificates, only: [:index, :show]
      resources :products, only: [:index]
      resources :degrees, only: [:index, :show]
      resources :lines, only: [:index, :show]
      resources :harmonies, only: [:index]
      resources :experiences, only: [:index]
      resources :salons, except: [:edit]
      resources :contacts, except: [:edit]
      resources :folios, only: [:index, :create, :destroy, :update]
      resources :posts do
        resources :comments, only: [:create, :destroy, :index, :update]
        resources :likes, only: [:create, :index] do
          collection { delete :destroy }
        end
      end
      resources :notifications, only: [:index, :show]
      resources :users, except: [:edit] do
        member { get :posts }
        resources :follows, only: [:create, :index] do
          collection { delete :destroy }
        end
        resources :notifications, only: [:index, :destroy]
      end
      resources :conversations, except: [:edit, :show] do
        resources :messages, except: [:edit] do
          member { post :read }
        end
      end
      resources :sessions, only: [:create, :destroy] do
        collection do
          get :environment
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
