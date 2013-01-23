Plazr::Application.routes.draw do

  root to: 'application#index'

  mount PlazrAuth::Engine => '/'
  
  resources :plazrrs
  resources :stores
  resources :store_categories
  resources :payment_methods

  get 'pages/prices' => 'pages#prices'
  get 'pages/terms' => 'pages#terms'
end
