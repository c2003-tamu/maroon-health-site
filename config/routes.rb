Rails.application.routes.draw do
  get 'medications/lowstock', to: 'medications#lowstock', as: 'lowstock_medications'
  resources :medications
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
