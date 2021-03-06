Onboarding::Application.routes.draw do

  root :to => "pages#home"
  
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :suggestions, :only => [:new, :create]
  resources :invitations, :only => [:new, :create]
  resources :plans
  resources :plan_creator
  resources :tasks
  resources :items
  resources :task_templates
  resources :item_templates
  resources :messages, :only => [:new, :create, :index]

  get 'plans/select'
  match "/home",    :to => "pages#home"
  match "/about",   :to => "pages#about"
  match "/contact", :to => "suggestions#new"
  match 'plans/modify', :to => "plans#modify"
  match 'plans/assign', :to => "plans#assign"
  match "/signup",      :to => "users#new"
  match "/settings",    :to => "pages#settings"
  match "/signin",      :to => "sessions#new"
  match "/signout",     :to => "sessions#destroy"
  match "/invitations", :to => "invitations#new"


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
  # match ':controller(/:action(/:id))(.:format)'
end
