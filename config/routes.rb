Rails.application.routes.draw do
  devise_for :users
  # root to: "beaches#index"
resources :messages, only: [:create,:update]
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :profiles
  resources :reviews , except: [:new, :create, :edit, :update]
  resources :events , except: [:new, :create] do
    resources :user_events, only:[:new, :create]
  end
  resources :user_events, except: [:new, :create]

  resources :beaches do
    resources :reviews, only:[:new, :create]
    resources :events, only:[:new, :create]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
