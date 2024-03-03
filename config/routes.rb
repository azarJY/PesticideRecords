Rails.application.routes.draw do

  devise_for :farmers, controllers: {
    registrations: "farmer/registrations",
    sessions: 'farmer/sessions'
  }

  devise_scope :farmer do
    post 'farmers/guest_sign_in', to: 'farmer/sessions#guest_sign_in', as: :farmer_guest_sign_in
  end

  root to: 'homes#top'

  namespace :farmer do

    resources :current_farmers, only: [:show, :edit, :update, :destroy]
    resources :farmlands, only: [:index, :new, :create, :show, :destroy]
    resources :pesticides, only: [:index, :new, :create, :show, :destroy]
    resources :records, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    post "records/confirm"
    resources :seasons, only: [:new, :create]

  end

  get "current_farmer/confirm", to: "farmer/current_farmers#confirm"

end