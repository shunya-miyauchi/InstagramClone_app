Rails.application.routes.draw do
  root "pictures#index"

  resources :pictures do
    collection do
      post 'confirm'
    end
  end
  resources :users, only: [:new,:create,:show,:edit,:update] do
    collection do
      get 'favorites'
    end
  end
  resources :sessions, only: [:new,:create,:destroy]
  resources :favorites, only: [:create,:destroy]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
