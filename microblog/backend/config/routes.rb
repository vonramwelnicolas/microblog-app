Rails.application.routes.draw do

  namespace :api do
      resources :blogs do
        member do
          patch 'update'
        end
      end
    end
end
