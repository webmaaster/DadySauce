Rails.application.routes.draw do
  get 'secrets/index'

  get 'secrets/new'

  get 'secrets/show'

  
resources :users,:sessions,:secrets
  get 'users/index'



  post 'secrets/:id/like' => 'likes#create',as:  'like'
  
  delete 'secrets/:id/unlike' => 'likes#destroy', as: 'unlike'
  

 root 'users#new' 
#new user
 post 'register'=> 'ursers#create',as:'register_new'
 get 'users/new'=>'users#new'
 #create users
 
 post 'users'=> 'user#create'
 #show users
 get 'users/:id'=> 'user#show'
# get 'secrets/:id/show'=> 'secrets#show' ,as:'secretes_show'
 #new login
  get 'login' => 'sessions#new',as:'login_new'
  get 'sessions/new'=>'sessions#new'
  #login
  post 'login'=> 'sessions#create',as: 'login'
  post 'sessions'=>'sessions#create'
  #logout
  get 'logout'=> 'sessions#delete',as:'logout'

  get 'sessions'=> 'sessions#destroy'
  
  
  get 'secret/:id/delete' =>'secrets#delete',  as: 'destroy_secrets'
  
  

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
