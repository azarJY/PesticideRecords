Rails.application.routes.draw do
  get 'farmers/show'
  get 'farmers/edit'
  get 'farmers/confirm'
  get 'farmers/unsubscrided'
  authenticated :farmer do
    # ログインしているユーザにしか表示できないようにしている
    resources :farmlands, only: [:index, :new, :create, :show, :destroy]
    resources :pesticides, only: [:index, :new, :create, :show, :destroy]
    resources :records, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    post "records/confirm"
    resources :seasons, only: [:new, :create]
  end
  
  root to: 'homes#top'
  devise_for :farmers
end
