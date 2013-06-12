Dpthomas::Application.routes.draw do

  root :to => 'home#index'

  resources :events
  resources :members
  resources :services
  resources :donations

end
