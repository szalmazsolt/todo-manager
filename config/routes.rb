Rails.application.routes.draw do
  get 'todo_completed/update'
  
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"

  get "register" => "users#new", as: "register"

  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy", as: "logout"

  resources :users, only: [:create, :edit, :update, :destroy]

  resources :users, except: [:index, :new] do
    resources :todos do
      member do
        patch :toggle_completed
      end
    end
  end

  
end
