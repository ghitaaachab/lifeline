Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check
  get "/dashboard", to: "dashboards#index", as: :dashboard
  resources :vital_signs
  resources :medical_files, only: [:index, :create, :destroy, :show]
  resources :vital_signs, only: [:index, :new, :create]
  resources :symptoms
  resources :medicines
  resources :patient_sheet, only: [:index, :create]
end
