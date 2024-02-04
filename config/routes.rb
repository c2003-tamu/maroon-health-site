Rails.application.routes.draw do
  resources :medication_transactions
  resources :medications
  resources :member_shifts
  resources :members
  resources :roles
  resources :faqs

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'about', to: 'about#index'
end
