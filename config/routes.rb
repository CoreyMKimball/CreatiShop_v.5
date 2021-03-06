Creatishop::Application.routes.draw do
  get "checkout/product_purchase"
  get "checkout/payment"
  get "checkout/cart"
  get "shopping/product_display"
  get "shopping/shop"

  get 'rails-admin', to: 'admin/dashboard#show'
  get "admin/dashboard/index"


   get "admin/managers/edit"
   get "admin/managers/new"
   post "admin/managers/update"

   get "admin/sessions/login"
   get "admin/sessions/logout"
   post "admin/sessions/login_attempt"

   get "admin/products/index"
   get "admin/products/new"
   get "admin/products/edit"
   get "admin/products/show"
   get "admin/products/delete"
   post "admin/products/create"
   post "admin/products/update"
   post "admin/products/multiple_remove"
  resources :charges, :only => :create
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'landing#land'

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
   scope module: 'admin' do
      resources :dashboard, :managers, :sessions, :products
    end
   namespace :admin do 
      get '', to: 'dashboard#index', as: '/'       
      resources :dashboard
   end 
end
