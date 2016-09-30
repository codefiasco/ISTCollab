Rails.application.routes.draw do
  root 'pages#homepage'

  resources :users
end
