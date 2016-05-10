Rails.application.routes.draw do
  resources :friends
  root :to => 'friends#index'
end
