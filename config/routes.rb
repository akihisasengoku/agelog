Rails.application.routes.draw do
  root to: 'static_pages#home'
  # get 'users/registrations/new_after_signup', to: 'users/registrations#new'
  # post 'users/registrations/new_after_signup', to: 'users/registrations#create'
  # get 'signup', to: 'users#new'
  # get 'login', to: 'sessions#new'
  # post 'login', to: 'sessions#create'
  # get 'following', to: 'static_pages#show'
  # get 'follower', to: 'static_pages#show'
  # get 'wanted_shops', to: 'static_pages#show'
  # get 'aged_shops', to: 'static_pages#show'
  # delete 'logout', to: 'sessions#destroy'
  
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
    :omniauth_callbacks => "users/omniauth_callbacks" 
  }
  resources :users, :only => [:index, :show]
  resources :users do
    member do
      get :followings
      get :followers
      get :wanted_shops
      get :aged_shops
      # get :new_after_signup
      # post :create_after_signup
    end
  end
  # resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  # resources :maps
  resources :categories
  resources :shops
  resources :areas
  resources :user_shops, only: [:create, :destroy]
  
  
  # Rails.application.routes.draw do
  #   devise_for :users, controllers: {
  #     sessions: 'users/sessions'
  #   }
  # end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
