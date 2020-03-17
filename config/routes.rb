Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[ index create update destroy ]
  resources :articles, only: %i[ index create update destroy ]
  resources :events, only: %i[ index create update destroy ]
  resources :entities, only: %i[ index create update destroy ]
  post '/entities/:id/users/new', to: 'entities#add_user'
  delete '/entities/:id/users/:user_id', to: 'entities#remove_user'
  resources :academic_events, only: %i[ create index update destroy ]
end
