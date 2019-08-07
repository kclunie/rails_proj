Rails.application.routes.draw do

  root 'sessions#index'

  get '/auth/:provider/callback' => 'sessions#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/events/popular_event' => 'events#popular_event'
  
  resources :events do 
    resources :attends, only: [:index, :new, :create]
  end
  

  resources :attends
  resources :users 
  resources :events


  #get 'events/bydate' => 'events/date'

  #get 'events/by_date', to: "events#by_date"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
