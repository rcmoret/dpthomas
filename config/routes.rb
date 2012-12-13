Dpthomas::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :members

  root :to => 'home#index'
  get 'about_us' => 'members#index', :as => 'about_us'
  get 'email' => 'email_list#new', :as => 'email'
  post 'email' => 'email_list#create', :as => 'email'

  resources :email_list
  resources :events, only: [:index]
  resources :donations, only: [:index]
  resources :members
  resources :services, only: [:index]

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
