Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  
  get 'pages/welcome'
  get 'pages/profile'
  
  post 'plans/start', to: 'plan#start'
  post 'plans/success', to: 'plan#success'
  get 'plans/reset', to: 'plan#reset'
  post 'plans/fail', to: 'plan#fail'
  
  authenticated :user do
    root :to => "pages#profile", as: :authenticated_root
  end

  root 'pages#welcome'
end
