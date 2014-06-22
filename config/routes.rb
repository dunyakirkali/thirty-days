Rails.application.routes.draw do
  devise_for :users
  get 'pages/welcome'

  root 'pages#welcome'
end
