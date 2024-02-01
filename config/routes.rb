Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :dashboards, only: [:index]
  resources :medical_files, only: [:index, :create, :destroy]
end
