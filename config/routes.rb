Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # authentication routes
      post :signin, to: 'auth#signin'
      post :signup, to: 'auth#signup'
      post :signout, to: 'auth#signout'

      # cars
      resources :cars
      post "delete_car", to: "cars#delete_car"

      # cities
      resources :cities
      
    end
  end
end
