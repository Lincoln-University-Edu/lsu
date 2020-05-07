Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'
  
  post '/auth/login', to: 'authentication#login'
  get '/profile/:id', to: 'users#profile'
  post '/send_push_notification', to: 'notifications#push_notifications'

  post '/search_promotions', to: 'search#promotions'
  post '/search_articles', to: 'search#articles'
  post '/search_entities', to: 'search#entities'
  post '/search_academic_events', to: 'search#academic_events'
  post '/search_events', to: 'search#events'
  post '/search_users', to: 'search#users'
  post '/search_student_wires', to: 'search#student_wires'

  get '/upcoming_events', to: 'events#upcoming_events'
  get '/past_events', to: 'events#past_events'

  resources :users, except: %i[ edit ]

  resources :articles, except: %i[ edit ]

  resources :events, except: %i[ edit ]

  resources :entities, except: %i[ edit ]
  get '/full_entities', to: 'entities#full_entities'
  post '/entities/:id/add_user_to_entity/:user_id', to: 'entities#add_user'
  delete '/entities/:id/remove_user_from_entity/:user_id', to: 'entities#remove_user'
  
  resources :academic_events, except: %i[ edit ]

  resources :majors, only: %i[ create index update destroy ]

  resources :promotions, except: %i[ edit ]

  resources :student_wires, except: %i[ edit ]

  resources :keywords, only: %i[ create index update destroy ]

  resources :categories, only: %i[ create index update destroy ]
end
