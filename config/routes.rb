Rails.application.routes.draw do
  root 'main_pages#home'
  
  get '/about',   to: 'main_pages#about'
  get '/help',    to: 'main_pages#help'
  get '/contact', to: 'main_pages#contact'
  
  get   '/signup',  to: 'users#new'
  post  '/signup',  to: 'users#create'
  get   '/edit',    to: 'users#edit'
  get 'users/new'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
end
