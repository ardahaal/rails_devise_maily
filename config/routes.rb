Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  mount MailyHerald::Webui::Engine => "/maily_webui"
end