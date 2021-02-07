# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    # locations end points
    get '/locations/nearme', to: 'locations#nearme'
    get 'static_assests', to: 'locations#get_static_assests'   
    resources :favourites
    resources :reviews, only: %i[create destroy]
    resources :locations,except: [:fave_check]
    # get '/locations', to: 'locations#index'
    # post '/locations', to: 'locations#create'
    # post '/new', to: 'favourites#create'
    # delete '/destroy', to: 'favourites#destroy'
    # post '/new', to: 'reviews#create'
    # post '/destroy/:id', to: 'reviews#destroy'
    # get '/favourites', to: 'favourites#index'
    # get '/locations/:id', to: 'locations#show'
    # put '/locations/:id', to: 'locations#update'
    # delete '/locations/:id', to: 'locations#destroy'
    # user sign up and authentication end points
    scope '/auth' do
      # post 'user_token' => 'user_token#create'
      # resources :users, only: [:create,:sign_in,:destroy]
      post '/sign_up', to: 'users#create'
      post '/sign_in', to: 'users#sign_in'
      # delete '/user/destroy', to: 'users#destroy'
    end
    # reviews end points
    # favorites end points

  end
end
