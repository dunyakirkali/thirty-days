Rails.application.routes.draw do
  devise_for :users
  get 'pages/welcome'
  get 'pages/profile'
  root 'pages#welcome'
end
