Rails.application.routes.draw do
  root 'main#index'
  scope "/:locale", locale: /#{I18n.available_locales.join("|")}/ do
    resources :users
    resources :images
    get 'main/index'
    get 'main/help'
    get 'main/contacts'
    get 'main/about'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#delete'
  end
end
