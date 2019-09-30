Rails.application.routes.draw do
  root 'main_pages#home'
  
  get '/about',   to: 'main_pages#about'
  get '/help',    to: 'main_pages#help'
  get '/contact', to: 'main_pages#contact'
  
  get   '/signup',  to: 'users#new'
  post  '/signup',  to: 'users#create'
  get   '/edit',    to: 'users#edit'
  resources :users do
    member do
      get :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get    '/login_ph',   to: 'session_pharmacists#new'
  post   '/login_ph',   to: 'session_pharmacists#create'
  delete '/logout_ph',  to: 'session_pharmacists#destroy'
  
  get '/medic',   to: 'medicines#index' # 全ての薬表示
  get '/medic',  to: 'medicines#show' #特定の薬表示
  resources :medicines
  
  resources :medicine_histories
  resources :medicine_history_pharmacists
  resources :user_pharmacists do
    member do
      get :following
    end
  end
  resources :relationships, only: [:create, :destroy]
  
  resources :side_effects
end
