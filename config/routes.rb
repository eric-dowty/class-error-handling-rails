Rails.application.routes.draw do

  resources :users

  get '*path', :to => 'errors#show'

end
