Rails.application.routes.draw do
  devise_for :members, controllers: {omniauth_callbacks: 'members/omniauth_callbacks', sessions: 'members/sessions', registrations: 'members/registrations'}
  resources :medication_transactions
  resources :medications
  resources :member_shifts
  resources :roles
  resources :faqs
  resources :members
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # for testing purposes
  root 'faqs#index'
end
