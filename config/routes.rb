Rails.application.routes.draw do
  get 'items/create'

    resources :lists do
      resources :items
    end

  root "lists#index"

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  get '/auth/:provider/callback', to: 'sessions#create'





end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
