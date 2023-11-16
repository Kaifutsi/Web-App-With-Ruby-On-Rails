Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'home#index'

  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy'
    get '/profile', to: 'users#profile', as: 'user_profile'

  end

  resources :manicures do
    resources :bookings, only: [:create, :index]
  end

  resources :users, only: [:new, :create]
  get '/bookings/all', to: 'bookings#all_bookings', as: 'all_bookings'
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  resources :hairstyles
  resources :wardrobe_selections
  resources :makeups
  resources :services do
    collection do
      get 'description'
    end
  end

  resources :images do
    resources :likes, only: [:create, :destroy]
  end

  get '/portfolio', to: 'portfolio#index'
  get '/about', to: 'home#about'
end
