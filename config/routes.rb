Rails.application.routes.draw do
  Rails.application.routes.draw do
    resources :lists do
      resources :items, :only => [:create]
    end

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  get '/auth/:provider/callback', to: 'sessions#create'

  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root 'lists#index'
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
