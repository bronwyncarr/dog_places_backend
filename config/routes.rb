# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    # locations end points
    get '/locations', to: 'locations#index'
    post '/locations', to: 'locations#create'
    post '/locations/nearme', to: 'locations#nearme'
    get '/locations/static_assests', to: 'locations#get_static_assests'
    get '/locations/:id', to: 'locations#show'
    put '/locations/:id', to: 'locations#update'
    delete '/locations/:id', to: 'locations#destroy'
    # user sign up and authentication end points
    scope '/auth' do
      post 'user_token' => 'user_token#create'
      post '/sign_up', to: 'users#create'
      post '/sign_in', to: 'users#sign_in'
      delete '/user/destroy', to: 'users#destroy'
    end
    # reviews end points
    scope '/locations/review' do
      post '/new', to: 'reviews#create'
      post '/destroy/:id', to: 'reviews#destroy'
    end
    # favorites end points
    scope '/locations/favorites' do
      post '/new', to: 'favourites#create'
      delete '/destroy', to: 'favourites#destroy'
      get '/favourites', to: 'favourites#index'
    end
  end
end
