Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'results/index'
  # get 'results/new'
  # get 'results/show'
  # get 'results/edit'
  # get 'answers/index'
  # get 'answers/new'
  # get 'answers/show'
  # get 'answers/edit'
  # get 'questions/index'
  # get 'questions/new'
  # get 'questions/show'
  # get 'questions/edit'
  # get 'quizzes/index'
  # get 'quizzes/new'
  # get 'quizzes/show'
  # get 'quizzes/edit'
  # get 'participants/index'
  # get 'participants/new'
  # get 'participants/show'
  # get 'participants/edit'
  # get 'users/index'
  # get 'users/new'
  # get 'users/show'
  # get 'users/edit'

  resources :users 
  resources :participants
  resources :quizzes
  resources :questions 
  resources :answers 
  resources :results 

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/signup' => 'users#create'
  post '/logout' => 'sessions#destroy'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
