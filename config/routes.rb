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
    resources :users do
      get :search, on: :collection
      resources :cars do
        resources :parts
        resources :logs
      end
    end
    post 'users/:user_id/cars/:car_id/parts/:part_id/logs' => 'logs#create',as: 'user_car_part_logs'
    patch 'users/:user_id/cars/:car_id/parts/:part_id/logs/:id' => 'logs#update',as: 'user_car_part_logs_update'
  end

  resources :users, only: [:show,:edit,:update,:create]

  resources :cars, only: [:show,:index,:edit,:update,:create,:destroy] do
    resources :parts, only: [:show,:update,:create,:destroy] do
       resources :logs , :controller => "parts/logs"
    end
    resources :logs, only: [:show,:index,:update,:create,:destroy]
  end

  namespace :admin do
    get 'homes/top'
  end

  #resources :logs

  get 'homes/top'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'

  #  日常点検view
  get 'dailys/daily'
  get 'dailys/oil'

end


