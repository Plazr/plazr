Plazr::Application.routes.draw do

  root to: 'plazrrs#index'

  mount PlazrAuth::Engine => '/'
  
  resources :plazrrs
  resources :payment_methods
<<<<<<< HEAD

  get 'pages/prices' => 'pages#prices'
  get 'pages/terms' => 'pages#terms'
=======
  resources :stores

  namespace :root do
    resources :users 
    resources :store_categories    
    

    match "users/:user_id/addrole" => "users#addrole" , :via => :get ,:as => :add_role
    match "users/:user_id/:role_id/rmrole" => "users#rmrole" , :via => :get ,:as => :rem_role
  end

    

>>>>>>> ad805d02c8c1e4d4463f8f1b8ea850a36139a399
end
