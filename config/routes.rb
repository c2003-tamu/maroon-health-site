Rails.application.routes.draw do
  resources :medication_transactions
  resources :medications
  resources :member_shifts
  resources :members
  resources :roles
  resources :faqs

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'

  get 'about', to: 'about#index'
  get 'donation', to: 'donation#index'
end
