Dpthomas::Application.routes.draw do

  devise_for :members do
    get 'members', to: 'members#dashboard', as: :member_root
  end

  root :to => 'home#index'
  get '/about_us' => 'members#index', as: :members
  get '/members/dashboard' => 'members#dashboard', as: :members_dashboard
  get '/newsletter/sign_up' => 'email_listings#new', as: :new_email_listing

  resources :events do
    resource :registration
  end

  resources :services, except: :show

  resources :email_listings, only: [:new, :create, :index]
  resources :donations, only: :new

  resources :members
  resources :discussions do
    resources :replies
  end

end
