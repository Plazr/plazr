Plazr::Application.routes.draw do

  root to: 'application#index'

  mount PlazrAuth::Engine => '/'
  
  resources :plazrrs
  resources :stores
  resources :payment_methods

  namespace :root do
    resources :users 
    
    match "users/:user_id/addrole" => "users#addrole" , :via => :get ,:as => :add_role
    match "users/:user_id/:role_id/rmrole" => "users#rmrole" , :via => :get ,:as => :rem_role

    #match 'users/add_role/:user_id/:role_id'

    resources :store_categories
    #match 'add_role/:user_id/:role_id' => 'user_roles#add', :as => :add_role, :via => :put
    #match 'rm_role/:user_id/:role_id' => 'user_roles#rem', :as => :rm_role,   :via => :put
  end

    

end
