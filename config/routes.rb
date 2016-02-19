Rails.application.routes.draw do
  root 'main#index'

  # Users
  resources :users

  # Sessions
  resources :user_sessions
  get 'login', to: 'user_sessions#new', :as => :login
  post 'logout', to: 'user_sessions#destroy', :as => :logout

  # Decks
  resources :decks

  # Cards
  resources :cards
  post 'revision_card' => 'cards#revision_card'

  # Oauth
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
end
