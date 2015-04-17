Rails.application.routes.draw do
#  devise_for :managers , :path => '', :path_names => {
#    :sign_in => "/dashboard/tekmqbs/login",
#    :sign_out => "/dashboard/tekmqbs/logout"
#  }
  root 'locations#index'

  resources :searchs, only: [:index]
  resources :locations ,only: [:index] do
    resources :hospitals, only: [:index]
  end
  resources :exams, only: [:index]
  get 'static_pages/service'


  match '/reserves', to: 'reserves#new', via: 'get'
  resources :reserves,only: [:new, :create]

  match '/contacts', to:'contacts#new', via: 'get'
  resources :contacts, only: [:new, :create]

  namespace :dashboard do 
    namespace :tekmqbs do 
      devise_for :users, controllers: {sessions: "dashboard/tekmqbs/sessions"}
      resources :dashboard, only:[:index]
      resources :hospitals, except: [:show, :destroy] do
        get 'exam', on: :member
        get 'item', on: :member
      end
      resources :exams, only:[:update] do
        get 'package', on: :member
      end
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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
