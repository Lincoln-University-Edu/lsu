Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/auth/login', to: 'authentication#login'
  
  resources :users, except: %i[ edit ]

  resources :articles, except: %i[ edit ]

  resources :events, except: %i[ edit ]

  resources :entities, except: %i[ edit ]
  post '/entities/:id/users/new', to: 'entities#add_user'
  delete '/entities/:id/users/:user_id', to: 'entities#remove_user'
  
  resources :academic_events, except: %i[ edit ]

  resources :majors, only: %i[ create index update destroy ]

  resources :promotions, except: %i[ edit ]

  resources :student_wires, except: %i[ edit ]

  resources :keywords, only: %i[ create index update destroy ]

  resources :categories, only: %i[ create index update destroy ]
end
