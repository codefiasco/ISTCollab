Rails.application.routes.draw do
  root 'pages#homepage'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'dashboard', to: 'pages#dashboard'

  get 'my_projects', to: 'projects#my_projects'

  resources :users
  resources :projects

  resources :conversations do
    resources :messages
  end
end
