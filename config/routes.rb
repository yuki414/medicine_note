Rails.application.routes.draw do
  root 'main_pages#home'
  
  get '/about',   to: 'main_pages#about'
  get '/help',    to: 'main_pages#help'
  get '/contact', to: 'main_pages#contact'
  
  get   '/signup',  to: 'users#new'
  post  '/signup',  to: 'users#create'
  get   '/edit',    to: 'users#edit'
  resources :users
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/medic',   to: 'medicines#index' # 全ての薬表示
  get '/medic',  to: 'medicines#show' #特定の薬表示
  resources :medicines
  
  get   '/mhis',      to: 'medicine_histories#index'
  resources :medicine_histories
  
  
end
