Rails.application.routes.draw do
  resources :resources
  get 'medications/lowstock', to: 'medications#lowstock', as: 'lowstock_medications'
  resources :medications
  devise_for :members, controllers: {omniauth_callbacks: 'members/omniauth_callbacks', sessions: 'members/sessions', registrations: 'members/registrations'}
  resources :medication_transactions
  resources :medications
  resources :events do
    resources :member_shifts, only: [:new, :create, :destroy]
  end
  resources :roles
  resources :faqs
  resources :member_shifts
  resources :calendar_events

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  get 'about', to: 'about#index'
  get 'donation', to: 'donation#index'
  get 'calendar', to: 'calendar#index'
  get 'calendar_events/display/:id', to: 'calendar_events#display', as: 'display_calendar_event'
  get '/signup', to: 'events#signup', as: 'signup'
  resources :members, except: [:new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # for testing purposes
  #root 'faqs#index'
end
