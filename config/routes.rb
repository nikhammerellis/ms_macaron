Rails.application.routes.draw do
  get '/about' => 'about#show'

  get 'orders/index'

  get 'orders/new'

  get 'orders/:id' => 'orders#show'

  post 'orders/create'

  delete 'orders/:id' => 'orders#destroy'

  get 'products/index'

  get 'products/new'

  get 'products/:id' => 'products#show'

  post 'products/create'

  get 'products/:id/edit' => 'products#edit'

  patch 'products/:id' => 'products#update'

  delete 'products/:id' => 'products#destroy'

  get 'messages/index'

  post 'messages/create'

  delete 'messages/:id' => 'messages#destroy'

  get 'sessions/new'

  post 'sessions/create'

  get '/signout' => 'sessions#destroy'

  get 'users/index'

  get 'users/new'

  post 'users/create'

  get '/users/:id/edit' => 'users#edit'

  patch 'users/:id' => 'users#update'

  delete 'users/:id' => 'users#destroy'

  root 'blogs#index'

  get 'blogs/index'

  get 'blogs/new' => 'blogs#new'

  get 'blogs/:id' => 'blogs#show'

  delete 'blogs/:id' => 'blogs#destroy'

  post 'blogs/create'

  get 'blogs/:id/edit' => 'blogs#edit'

  patch 'blogs/:id' => 'blogs#update'

  get 'blogs/destroy'

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
