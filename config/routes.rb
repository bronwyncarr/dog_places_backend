# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    # locations end points
    get '/locations/nearme', to: 'locations#nearme'
    get 'static_assests', to: 'locations#get_static_assests'
    resources :favourites
    resources :reviews, only: %i[create destroy index]
    resources :locations, except: [:fave_check]
    scope '/auth' do
      post '/sign_up', to: 'users#create'
      post '/sign_in', to: 'users#sign_in'
      delete '/user/destroy', to: 'users#destroy'
    end
  end
end
