Rails.application.routes.draw do
  get 'todo_completed/update'
  
  get "up" => "rails/health#show", as: :rails_health_check

  root "todos#index"

  resources :todos do
    member do
      patch :toggle_completed
    end
  end

  get "register" => "users#new", as: "register"
  resources :users, except: [:new]

  
end
