# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    # locations end points 
    get '/locations', to: 'locations#index'
    post '/locations', to: 'locations#create'
    get '/locations/static_assests', to: 'locations#get_static_assests'
    get '/locations/:id', to: 'locations#show'
    put '/locations/:id', to: 'locations#update'
    delete '/locations/:id', to: 'locations#destroy'
    get '/locations/nearme', to: 'locations#nearme'
    # user sign up and authentication end points 
    scope '/auth' do
      post 'user_token' => 'user_token#create'
      post '/sign_up', to: 'users#create'
      post '/sign_in', to: 'users#sign_in'
      end
      # reviews end points 
      scope '/locations/:id/review' do
        post '/new/', to: 'reviews#create'
        post '/destroy/:id', to: 'reviews#destroy'
    end
    #favorites end points
    scope '/location/favorite' do 
      post '/new/:id', to: 'favorite#create'
        post '/destroy/:id', to: 'favorite#destroy'
    end
  end
end
