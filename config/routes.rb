Rails.application.routes.draw do
  resources :comments
  resources :registrations
  resources :events
  resource :session
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'home_page#index'
end
