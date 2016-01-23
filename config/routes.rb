Rails.application.routes.draw do

  
  
  root 'quotes#show'
  get '/auth/:provider/callback', to: 'sessions#create'
end
