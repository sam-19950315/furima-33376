Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:show, :index, :new, :create, :edit, :update]
end
