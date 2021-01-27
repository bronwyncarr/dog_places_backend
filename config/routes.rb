Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    get '/locations', to: 'locations#index'
    post '/locations', to: 'locations#create'
    get '/locations/:id', to: 'locations#show'
    put '/locations/:id', to: 'locations#update'
    delete '/locations/:id', to: 'locations#destroy'
    get '/locations/nearme', to: 'locations#nearme'
    scope '/auth' do
    post '/sign_up', to: 'users#create'
    post '/sign_in',to: 'users#sign_in'
    end
  end
end
