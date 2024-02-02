Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :dashboards, only: [:index]
  resources :medical_files, only: [:index, :create, :destroy]
  resources :symptoms, only: [:index, :new, :create]
  resources :vital_signs
  resources :patient_sheet, only: [:index, :create]
end
