Dpthomas::Application.routes.draw do

  root :to => 'home#index'

  resources :pages, only: [:update, :show]

end
