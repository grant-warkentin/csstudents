Rails.application.routes.draw do
  resource :profile, controller: 'profile'
  get 'users', to: 'users#index'
  get 'user_profiles/:user_id', to: 'profile#show', as: 'user_profile'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'home#index'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
