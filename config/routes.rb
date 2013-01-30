Plazr::Application.routes.draw do

  mount PlazrAuth::Engine => '/'

  resources :plazrrs
  resources :payment_methods
  resources :stores

  namespace :root do
    resources :users
    resources :store_categories
    match "users/:user_id/addrole" => "users#addrole" , :via => :get ,:as => :add_role
    match "users/:user_id/:role_id/rmrole" => "users#rmrole" , :via => :get ,:as => :rem_role
  end

  get 'pages/prices' => 'pages#prices'
  get 'pages/terms' => 'pages#terms'
  get 'pages/index' => 'pages#index'
  get 'pages/about' => 'pages#about'

  root to: 'pages#index'

end
