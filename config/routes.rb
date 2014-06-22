Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  
  get 'pages/welcome'
  get 'pages/profile'

  authenticated :user do
    root :to => "pages#profile", as: :authenticated_root
  end

  root 'pages#welcome'
end
