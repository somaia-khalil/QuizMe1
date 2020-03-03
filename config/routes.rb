Rails.application.routes.draw do
  
  resources :users
  resources :participants
  resources :quizzes
  resources :questions 
  resources :answers 
  resources :results 

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  delete '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
