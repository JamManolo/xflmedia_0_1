Xflmedia01::Application.routes.draw do

  match "/users/:id/microposts", :to => "users#show"
  resources :users do
    member do
      get :following, :followers, :leagues, :confirm
    end
  end
  resources :sessions,      :only => [:new, :create, :destroy]
  resources :microposts,    :only => [:create, :destroy, :index]
  resources :relationships, :only => [:create, :destroy]
  resources :groups do
    member do
      get :members, :edit_membership, :transfer_roster, :new_invitation
      post :send_invitation, :accept_invitation
    end
  end
  resources :rosters
  resources :memberships,   :only => [:create, :destroy]
  resources :league_formats
  resources :lineup_formats
  resources :scoring_formats
  resources :invitations
    
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'

  match '/details/template'      => 'details#template'  
  match '/details/league_type'   => 'details#league_type'
  match '/details/comp_type'     => 'details#comp_type'
  match '/details/divisions'     => 'details#divisions'
  match '/details/yardage'       => 'details#yardage'  
  match '/details/yardage_bonus' => 'details#yardage_bonus'
  match '/details/playoffs'      => 'details#playoffs'
  match '/details/pts_allowed'   => 'details#pts_allowed'
  match '/details/yds_allowed'   => 'details#yds_allowed'
  
  match '/groups/send_invitation'    => 'groups#send_invitation'
  match '/groups/accept_invitation'  => 'groups#accept_invitation'
  
  # match 'add_member', :to => 'groups#add_member'
  #get "details/divisions"
  #get "details/league_type"
  #get "details/comp_type"
  #get "pages/home"
  #get "pages/contact"
  #get "pages/about"
  #get "pages/help"

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
  # root :to => "welcome#index"
  root :to => 'pages#home'
  
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
