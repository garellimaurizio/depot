Rails.application.routes.draw do
#  get 'admin/index' 		I rewrite the rule deleting the index for make the address more short
  get 'admin' => 'admin#index'

#  get 'session/new'
#  get 'session/create' 	I change the URL for make it more semantically correct for the user
#  get 'session/destroy'
  controller :sessions do
    get  'login' => 'session#new'
    post 'login' => 'session#create'
	get 'logout' => 'session#destroy'
  end
  
  get "sessions/create"
  get "sessions/destroy"

  resources :users
#  resources :orders 			Moved inside a scope declaretion for add translation to it
#  resources :line_items		Moved inside a scope declaretion for add translation to it
#  resources :carts				Moved inside a scope declaretion for add translation to it
  get 'store/index'
  
  resources :products do
	  get :who_bought, on: :member
  end
  
  
#  root 'store#index', as: 'store'		Moved inside a scope declaretion for add translation to it
  
  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store', via: :all
  end
  
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
