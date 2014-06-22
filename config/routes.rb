Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  
  get 'pages/welcome'
  get 'pages/profile'
  
  post 'plans/start', to: 'plan#start'

  authenticated :user do
    root :to => "pages#profile", as: :authenticated_root
  end

  root 'pages#welcome'
end
