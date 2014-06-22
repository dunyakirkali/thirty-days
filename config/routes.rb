Rails.application.routes.draw do
  get 'pages/welcome'

  root 'pages#welcome'
end
