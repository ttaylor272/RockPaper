Rails.application.routes.draw do
   get 'game/index'
  root 'game#index'

  post '/throw' => 'game#throw'
    
end
