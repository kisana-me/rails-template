Rails.application.routes.draw do
  root "pages#index"

  # Pages
  get "terms-of-service" => "pages#terms_of_service"
  get "privacy-policy" => "pages#privacy_policy"
  get "contact" => "pages#contact"
  get "sitemap" => "pages#sitemap"

  # Accounts
  resources :accounts, param: :aid

  # Images
  resources :images, param: :aid

  # Sessions
  get "sessions/start"
  delete "signout" => "sessions#signout"
  resources :sessions, except: [ :new, :create ], param: :aid

  # Signup
  get "signup" => "signup#new"
  post "signup" => "signup#create"

  # OAuth
  post "oauth/start" => "oauth#start"
  get "oauth/callback" => "oauth#callback"
  post "oauth/fetch" => "oauth#fetch"

  # Settings
  get "settings" => "settings#index"
  post "settings" => "settings#update"
  get "settings/account" => "settings#account"

  # Others
  get "up" => "rails/health#show", as: :rails_health_check

  # Errors
  match "*path", to: "application#routing_error", via: :all
end
