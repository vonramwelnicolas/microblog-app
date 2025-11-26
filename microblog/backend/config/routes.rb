Rails.application.routes.draw do
  root to: proc { |env| [200, {}, ['<html><body><h1>Rails is running!</h1></body></html>']] }

  get '/arbitrary', to: proc { |env| [200, {'Content-Type' => 'application/json'}, ['{"message": "This is arbitrary JSON", "timestamp": "' + Time.current.to_s + '", "random": ' + rand(1000).to_s + '}']] }

  namespace :api do
    resources :users, only: [:create, :index]
    post 'login', to: 'auth#login'
      resources :blogs do
        member do
          patch 'update'
        end
      end
    end
end


