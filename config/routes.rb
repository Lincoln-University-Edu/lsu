Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[ index create update destroy ]
  resources :articles, only: %i[ index create update destroy ]
  resources :events, only: %i[ index create update destroy ]
end
