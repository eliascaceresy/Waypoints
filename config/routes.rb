Rails.application.routes.draw do
  root 'waypoints#show'

  namespace :api do
    namespace :v1 do
      resources :gps, only: [:index, :create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
