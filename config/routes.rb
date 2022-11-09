Rails.application.routes.draw do
  get 'searches/index'
  post 'searches/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'searches#index'
end
