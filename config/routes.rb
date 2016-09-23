Rails.application.routes.draw do
  devise_for :users
  resources :companies do
    resources :reviews
  end
  root 'companies#index'
end
