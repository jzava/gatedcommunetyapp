Rails.application.routes.draw do
  get 'abouts/index'

  devise_for :users
  
  resources :companies do
    resources :reviews 
  end
  

 
 
  root 'companies#index'
end
