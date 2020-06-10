Rails.application.routes.draw do
  root 'main#index'
  scope "/:locale", locale: /#{I18n.available_locales.join("|")}/ do
    resources :users
    resources :images
    resources :themes
    resources :values
    get 'main/index'
    get 'main/help'
    get 'main/contacts'
    get 'main/about'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/logout', to: 'sessions#delete'
    match 'works', to: 'works#index', via: 'get'
    match 'choose_image', to: 'works#choose_image', via: :get
    match 'display_theme', to: 'works#display_theme', via: :post
    match 'choose_theme', to: 'works#choose_theme', via: :get
    match 'results_list', to: 'work#results_list', via: :get

    # Api definition
    namespace :api, defaults: {format: :json} do
      match 'next_image', to: 'api#next_image', via: 'get'
      match 'prev_image', to: 'api#prev_image', via: 'get'
      match 'save_value', to: 'api#save_value', via: :get
    end
  end
end
