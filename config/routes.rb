Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#show'
  get 'auth/google_oauth2/callback', controller: :sessions, action: :create
  get 'auth/failure', to: redirect('/')
  delete '/logout', controller: :sessions, action: :destroy
  resources :users, only: %i[show edit update]
  resources :trips
  resources :resorts
end
