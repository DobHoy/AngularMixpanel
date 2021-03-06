KatalystApp::Application.routes.draw do
    require 'sidekiq/web'
  resources :carts do 
        get 'test'
  end



  #get 'high_voltage/pages#show', id: 'cartpage'

  resources :lineitems
  

  resources :products

  mount StripeEvent::Engine => '/stripe-webhooks'
  root :to => 'high_voltage/pages#show', id: 'landingpage'
  # want to go to landing page
 
  devise_for :customers, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  devise_scope :customer do
    get "/products", to: "products#index", as: :customer_root
  end
  #   devise_for :customers, path_names: {sign_in: 'login', sign_out: 'logout'}

  # authenticate :customer, lambda {|u| u.admin? } do 
      mount Sidekiq::Web => '/sidekiq'
  # end

  # devise_scope :customers do 
  #   get 'login', to: 'devise/sessions#new'
  #   delete "logout" => "devise/sessions#destroy"
  # end


  resources :customers


  resources :orders do
    member do 
      get :pay
      post :process_payment
    end
  end


  resources :photos


  get "instagram/index"

  get "instagram/connect"

  get "instagram/callback"

  get "instagram/user_recent_media"

  get "instagram/logout_instagram"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
