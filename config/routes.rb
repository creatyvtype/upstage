Rails.application.routes.draw do

  devise_for :users
  root 'pages#home'

  resources :productions, only: [:index, :show]
  resources :users, only: [:show, :update]
  resources :companies do
    resources :productions, only: [:new, :create, :update, :destroy]
  end

  get '/companies/:id/approve', to: 'companies#approve', as: :company_approval
  get '/companies/:id/admin', to: 'companies#member_show', as: :company_member
  get '/my_productions', to: 'productions#my_productions', as: :my_productions
  get '/my_companies', to: 'companies#my_companies', as: :my_companies
  get '/about', to: 'pages#about'
  get '/thanks', to: 'pages#thanks'
  get '/dashboard', to: 'pages#dashboard'
  get '/denied', to: 'pages#denied'

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
