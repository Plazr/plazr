Plazr::Application.routes.draw do

  root to: 'application#index'

  mount PlazrAuth::Engine => '/'
  
  resources :plazrrs
  resources :stores
  resources :payment_methods

  namespace :root do
    resources :users
    resources :store_categories
  end
end
