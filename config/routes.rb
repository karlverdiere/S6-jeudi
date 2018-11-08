Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  get '/show/:id',   to: 'home#show'
	post '/show',   to: 'home#show'	
end
