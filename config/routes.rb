Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :dashboards, only: [:index]
  resources :medical_files, only: [:index, :create, :destroy, :show]
  end
  resources :vital_signs, only: [:index, :new, :create]
end
