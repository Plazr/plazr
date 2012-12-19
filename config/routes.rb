Plazr::Application.routes.draw do

  root to: 'application#index'

  mount PlazrAuth::Engine => '/'
  
  resources :plazrrs
  resources :payment_methods

  namespace :root do
    resources :users 
    resources :store_categories    
    resources :stores

    match "users/:user_id/addrole" => "users#addrole" , :via => :get ,:as => :add_role
    match "users/:user_id/:role_id/rmrole" => "users#rmrole" , :via => :get ,:as => :rem_role
  end

    

end
