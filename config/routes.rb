Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'static_page/home'
  get '/dictionary', to: 'learning_dictionary#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root   'static_pages#home'
  # get    '/help',    to: 'static_pages#help'
  # get    '/about',   to: 'static_pages#about'
  # get    '/contact', to: 'static_pages#contact'
  # get    '/signup',  to: 'users#new'
  # get    '/login',   to: 'sessions#new'
  # post   '/login',   to: 'sessions#create'
  # delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :teaching_ideas,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]

end
