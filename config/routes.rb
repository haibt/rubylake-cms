RubyLakeCms::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  namespace :admin do
    resources :articles
  end

  devise_for :users, :controllers => {
                      :registrations => "users/registrations",
                      :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
  #get 'sign_in', :to => 'users/sessions#new', :as => :new_user_session
  #get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
    match "/login" => "devise/sessions#new" # Add a custom sign in route for user sign in
    match "/logout" => "devise/sessions#destroy" # Add a custom sing out route for user sign out
    match "/login/forgot-password" => "devise/passwords#new" # Add a Custom Route for Forgot password
    match "/login/restore-password" => "devise/passwords#create" # Add a Custom Route for Forgot password
  end
  match '/profile' => 'home#profile'
  get '/article/new' => 'articles#new'
  post '/article/create' => 'articles#create'
  get '/article/:permalink/edit' => 'articles#edit'
  post '/article/:permalink/edit' => 'articles#update'
  match '/article/:permalink' => 'articles#show'
  match '/article/:permalink/move' => 'articles#move'
  match '/article/:permalink/delete' => 'articles#delete'

  get '/category/new' => 'categories#new'
  post '/category/create' => 'categories#create'
  get '/category/:permalink/edit' => 'categories#edit'
  post '/category/:permalink/edit' => 'categories#update'
  match '/category' => 'categories#index'
  match '/category/:permalink' => 'categories#show'
  match '/category/:id/delete' => 'categories#destroy'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  post '/comments/:id/delete'=> 'comments#destroy'
  post '/comments/:id/update'=> 'comments#update'
  resources :comments
  #resources :versions
  resources :images
  post '/images/uploadFile' => 'images#uploadFile'
  post '/images/:id/delete'=> 'images#destroy'

  resources :settings
  match '/setting/index' => 'settings#index'
  post '/setting/create'=> 'settings#create'
  resources :themes
  match 'theme/index' => 'themes#index'
  match 'theme/message' => 'themes#message'
 
  #post 'home/setting/new' => 'company#create'
  # Sample of regular route:

  match '/images/:id/set_default'=> 'images#set_default'
  resources :home
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
  # match ':controller(/:action(/:id))(.:format)'
  root :to => "home#profile"
end
