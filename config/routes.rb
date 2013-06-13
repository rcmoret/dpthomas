Dpthomas::Application.routes.draw do

  root :to => 'home#index'
  get '/about_us' => 'members#index', as: :members

  resources :events
  resources :members
  resources :services
  resources :donations

end
