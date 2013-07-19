Dpthomas::Application.routes.draw do

  devise_for :members do
    get 'members', to: 'members#dashboard', as: :member_root
  end

  root :to => 'home#index'
  get '/about_us' => 'members#index', as: :members
  get '/members/dashboard' => 'members#dashboard', as: :members_dashboard

  resources :events, except: :show
  resources :members
  resources :services, only: :index
  resources :donations, only: :new

  resources :discussions do
    resources :replies
  end

end
