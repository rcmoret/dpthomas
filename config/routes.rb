Dpthomas::Application.routes.draw do

  devise_for :members, skip: :registrations
  as :member do
    get 'members/edit' => 'devise/registrations#edit', as: :edit_member_registration
    put 'members' => 'devise/registrations#update', as: :member_registration
  end

  root :to => 'home#index'
  get '/about_us' => 'members#index', as: :members
  get '/members/dashboard' => 'members#dashboard', as: :members_dashboard
  get '/newsletter/sign_up' => 'email_listings#new', as: :new_email_listing
  get '/events/:event_id/registrations/complete/:id' => 'registrations#show', as: :complete_registration
  get '/home/donate/' => 'home#donate', as: :donations

  resources :events do
    resources :registrations
  end

  resources :services, except: :show

  resources :email_listings, only: [:new, :create, :index]
  resources :donations, only: :new

  resources :members
  resources :discussions do
    resources :replies
  end

  resources :announcements

end
