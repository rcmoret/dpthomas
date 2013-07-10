Dpthomas::Application.routes.draw do

  root :to => 'home#index'
  get '/about_us' => 'members#index', as: :members

  resources :events, except: :show
  resources :members, only: [:show, :edit]
  resources :services, only: :index
  resources :donations, only: :new

end
