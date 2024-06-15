Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "pages#home"

  get "register" => "users#new", as: "register"
  get "login" => "sessions#new", as: "login"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy", as: "logout"

  resources :users, except: [:index] do
    resources :todos, except: [:show] do
      member do
        patch :toggle_completed
      end
    end
  end

  get "*path" => "pages#home"


  
end
