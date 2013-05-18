Dpthomas::Application.routes.draw do
  devise_for :members

  root :to => 'home#index'

  resources :pages, only: [:update, :show]

end
