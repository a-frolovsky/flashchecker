Rails.application.routes.draw do
  root 'main#index'

  # Users
  resources :users

  # Sessions
  resources :user_sessions
  get 'login', to: 'user_sessions#new', :as => :login
  post 'logout', to: 'user_sessions#destroy', :as => :logout

  # Cards
  resources :cards
  post 'revision_card' => 'cards#revision_card'

  # 404
  match "/(*url)", to: redirect('/404'), via: [:get, :post]
end
