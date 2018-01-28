Rails.application.routes.draw do
  root to: 'artists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists do
    resources :songs
  end
  namespace :api do
    resources :artists, only: [:show,:destroy] do
      resources :songs, only: [:create,:destroy]
    end
  end
end
