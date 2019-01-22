Rails.application.routes.draw do
  # mount ActionCable.server => '/cable'
  resources :rooms
  root to: 'rooms#show'
  # get "cable", to: "rooms#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
