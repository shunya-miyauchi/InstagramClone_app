Rails.application.routes.draw do
  resources :pictures
  resources :users, only: [:new,:create,:show,:edit,:update]
  resources :sessions, only: [:new,:create,:destroy]
end
