Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'auth/google_oauth2/callback', to: 'sessions#auth'
  get 'auth/failure', to: redirect('/')
  root '/', to: 'welcome#index'
end
