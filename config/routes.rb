Rails.application.routes.draw do
  get 'user_reports/show'
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check
  get "/dashboard", to: "dashboards#index", as: :dashboard

  get "/medical_files/:id/download", to: "medical_files#download", as: :download_medical_file
  get "/medical_files/:id/preview_file", to: "medical_files#preview", as: :preview_medical_file
  resources :appointments
  resources :medical_files, only: [:index, :create, :destroy, :show]
  resources :vital_signs, only: [:index, :new, :create]
  resources :symptoms
  resources :medicines
  resources :patient_sheet, only: [:index, :create]
end
