require 'api_constraints'
Rails.application.routes.draw do  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api, defaults: { format: :json }, constraints: { localhost: 'api' }, path: '/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      root to: 'home#index', as: 'api_home'
      resources :brands, only: [:index, :show]
      get "/all_posts" => "brands#all_posts"
      get "/trending_posts" => "brands#trendings"
      get "/editor_pics_posts" => "brands#editor_pics"
     
      resources :services, only: [:index, :show]
      resources :tags, only: [:index, :show, :create] do
        collection do 
          get :exact 
          get :all_tags
        end
        member { get :posts }
      end
      resources :push_notifications, only: %i[index update] do
        post :reset_badge_count, on: :collection
      end
      # resources :payments
      resources :carts, only:[:index, :create]
      put "/update_cart" => "carts#update_cart"
      post "/remove_from_cart" => "carts#remove_from_cart"
      resources :addresses
      resources :searches, only: [:index] do
          collection do
            get :product_brands
            get :search_products
            post :filter_products
          end
      end
      resources :discount_sliders, only: [:index]
      resources :sub_categories, only: [:index]
      resources :store_shop_its, only: [:index]
      resources :store_landing_sales, only: [:index]
      resources :orders, only:[:index, :create, :show]
      resources :categories, only: [:index, :show]
      get "/search_by_categories" => "categories#search_by_categories"
      resources :certificates, only: [:index, :show]
      resources :products, only: [:index, :show]
      # get "/search_product" => "products#search_product"
      get "/trending_products" => "products#trending_products"
      resources :degrees, only: [:index, :show]
      resources :lines, only: [:index, :show]
      resources :harmonies, only: [:index]
      resources :experiences, only: [:index]
      resources :salons, except: [:edit] do
        member { get :stylists }
      end
      resources :contacts, except: [:edit]
      resources :folios, only: [:index, :create, :destroy, :update] do
        member do
          get :posts
          post :add_post
          delete :remove_post
        end
      end
      
      resources :posts do
        resources :comments, only: [:create, :destroy, :index, :update]
        resources :likes, only: [:create, :index] do
          collection { delete :destroy }
        end
        collection do
          get :user_posts
          get :posts_by_tag
        end
      end

      resources :products do
        # resources :comments, only: [:create, :destroy, :index, :update]
        resources :favourites, only: [:create, :index] do
          collection { delete :destroy }
        end
      end
      resources :photos, only: [:update]
      resources :notifications, only: [:index, :show]
      get "/user/likes/:id" => "users#user_likes"
      get "/user/favourites/:id" => "users#user_favourites"
      resources :users, except: [:edit] do
        resources :educations, except: [:edit]
        resources :offerings, except: [:edit]
        member do
          get :posts
          get :folios
        end
        resources :follows, only: [:create, :index] do
          collection { delete :destroy }
        end
        resources :blocks, only: [:create, :index] do
          collection { delete :destroy }
        end
        resources :notifications, only: [:index, :destroy]
      end
      resources :conversations, except: [:edit, :show] do
        member { post :read }
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
      namespace :warehouse do
        resources :products, except: %i[new edit]
        resources :sessions, only: %i[create destroy]
      end
      namespace :delivery do
        resources :sessions, only: %i[create destroy]
        resources :orders, only: %i[index update show]
      end
      resources :cards, only: %i[index create destroy] do
        put :make_primary, on: :member
      end
    end
  end

  #CMS Page
  get "pages/:slug" => "pages#show"   
  get "/view_post_meta/:id" => "api/v1/refers#view_post_meta"

  #Errors
  get "/404" => "api/v1/errors#not_found"
  get "/500" => "api/v1/errors#exception"

  devise_for :users
  root to: 'home#index'
end
