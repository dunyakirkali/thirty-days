Rails.application.routes.draw do
  get 'pages/welcome'
  get 'pages/profile'
  root 'pages#welcome'
end
