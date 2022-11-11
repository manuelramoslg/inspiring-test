Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  scope "(:locale)", locale: /en|es/ do
    get 'searches/index'
    get 'searches/random'
    post 'searches/create'
    post "searches/send_fact_email"

    devise_for :users
    root 'searches#index'
  end

  mount Sidekiq::Web => '/sidekiq'
end
