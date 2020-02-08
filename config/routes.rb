Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }


  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :admin do
    resources :logs
  end

  namespace :admin do
    resources :parts
  end

  namespace :admin do
    resources :cars
  end

  namespace :admin do
    resources :users
  end

  resources :users

  resources :cars do

  resources :parts

  end

  resources :logs

  get 'homes/top'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'


end

