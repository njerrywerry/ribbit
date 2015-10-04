Rails.application.routes.draw do
  resources :relationships
  resources :ribits
  get 'sessions/new'

  post 'sessions/create'

  get 'sessions/destroy'

  resources :users
  root to: 'users#new'

  get 'buddies', to: 'users#buddies', as: 'buddies'

end
