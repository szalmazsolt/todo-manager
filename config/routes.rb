Rails.application.routes.draw do
  get 'todo_completed/update'
  
  get "up" => "rails/health#show", as: :rails_health_check

  resources :todos, except: [:show] do
    member do
      patch :toggle_completed
    end
  end
  
end
