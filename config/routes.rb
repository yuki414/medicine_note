Rails.application.routes.draw do
  get 'users/new'

  root 'main_pages#home'
  
  get '/about',   to: 'main_pages#about'
  get '/help',    to: 'main_pages#help'
  get '/contact', to: 'main_pages#contact'
  get '/signup',  to: 'users#new'
end
