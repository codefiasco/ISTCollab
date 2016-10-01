Rails.application.routes.draw do
  root 'pages#homepage'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'dashboard', to: 'pages#dashboard'

  resources :users
  resources :projects
end
