Rails.application.routes.draw do
  devise_for :users
  get "pages", to: "pages#home"
  root to: "groups#index"

  resources :groups do
    resources :members, only: :create
    resources :activities, only: [:index]
    resources :messages, only: :create
  end
  resources :activities, only: [:show]
  resources :members, only: :destroy

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # Defines the root path route ("/")
  # root "posts#index"
end
