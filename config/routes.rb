Rails.application.routes.draw do
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
