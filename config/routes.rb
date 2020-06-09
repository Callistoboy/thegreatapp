Rails.application.routes.draw do
  root 'main#index'
  scope "/:locale", locale: /#{I18n.available_locales.join("|")}/ do
    get 'main/index'
    get 'main/help'
    get 'main/contacts'
    get 'main/about'
  end
end
