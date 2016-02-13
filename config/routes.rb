Rails.application.routes.draw do

  
  
  root 'quotes#show'
  post 'quotes', to: 'quotes#tweet'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
