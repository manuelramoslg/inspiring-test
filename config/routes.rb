Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  
  mount Sidekiq::Web => '/sidekiq'
  
  scope "(:locale)", locale: /en|es/ do
    get 'searches/index'
    get 'searches/random'
    post 'searches/create'
    post "searches/send_fact_email"

    devise_for :users
    root 'searches#index'
    
    # Custom Errors
    %w( 404 403 500 400).each do |code|
      get code, :to => "errors#show", :code => code
    end
  end
end
