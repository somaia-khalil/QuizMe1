Rails.application.routes.draw do


  resources :users 
  resources :participants
  resources :quizzes
  resources :questions 
  resources :answers 
  resources :results 

  get '/' => 'quizzes#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  

  delete '/logout' => 'sessions#destroy'

end
