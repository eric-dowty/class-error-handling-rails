Rails.application.routes.draw do

  resources :users

  # The *path is a NOT FOUND route... basically redirects anything that is not a real route
  get '*path', :to => 'errors#show'

end
