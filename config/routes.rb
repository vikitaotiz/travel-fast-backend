Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # authentication routes
      post :signup, to: 'auth#signup'
    end
  end
end
