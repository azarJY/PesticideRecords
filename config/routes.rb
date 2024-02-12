Rails.application.routes.draw do
  
  devise_for :farmers, controllers: {
    registrations: "farmer/registrations",
    sessions: 'farmer/sessions'
  }
  
  root to: 'homes#top'
  
  namespace :farmer do

    resource :current_farmer, only: [:show, :edit, :update, :confirm, :destroy]
    resources :farmlands, only: [:index, :new, :create, :show, :destroy]
    resources :pesticides, only: [:index, :new, :create, :show, :destroy]
    resources :records, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    post "records/confirm"
    resources :seasons, only: [:new, :create]

  end
  
end
