WebProject::Application.routes.draw do
  


  get "comment/create"

 # get "user/show"

  devise_for :users 
 # resources :users, :only => [:show]
  resources :questions, only: [:create, :destroy] do
   member do
     post 'upvote'
     post 'downvote'
     post 'accept'
   end
  end
  resources :answers, only: [:create, :destroy]
  
  resources :comments, only: [:create, :destroy]

  root :to => "static_pages#home"

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact' 
  match '/profile', to: 'users#show'
  match '/users', to: 'users#index'
  match '/users/:id', :to => 'users#destroy', :as => :user
  match '/users/:id/edit', :to => 'users#edit' , :as => :edit_user
  match '/questions/:id', :to => 'questions#reply'
  match '/questions/:id', :to => 'questions#destroy', :as => :question_destroy
  match '/questions/:id/upvote', :to => 'questions#upvote', :as => :question_upvote
  match '/questions/:id/downvote', :to => 'questions#downvote', :as => :question_downvote
  match '/questions/:id/accept', :to => 'questions#accept', :as => :question_accept
  
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
  end 
  
  devise_scope :user do
    get "sign_up", :to => "devise/registrations#new"
  end 

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
