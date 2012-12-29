Dpthomas::Application.routes.draw do
  devise_for :members

  root :to => 'home#index'
  get 'about_us' =>'members#index', :as => 'about_us'
  get 'email' => 'email_list#new', :as => 'email'
  post 'email' => 'email_list#create', :as => 'email'

  resources :email_list
  resources :events, only: [:index]
  resources :donations, only: [:index]
  resources :members
  resources :services, only: [:index]

end
