Rails.application.routes.draw do
  root to: "home#index"
  jsonapi_resources :offers, only: [:index, :show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
