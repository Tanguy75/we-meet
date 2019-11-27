Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events, only: [:index, :new, :create, :edit, :update] do
    resources :meetings, only: [:index, :new, :edit, :update]
    get "/share", to: "events#share"
  end

  resources :events, only: [:show] do
    resources :suggested_bars, only: [:index]
  end
end
