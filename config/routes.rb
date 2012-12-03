Plazr::Application.routes.draw do
  #mount PlazrAuth::Engine => '/'
  
  resources :plazrrs
  resources :stores
  resources :store_categories
  resources :payment_methods
end
