 ActionController::Routing::Routes.draw do |map|
  map.resources :providers

  map.resources :clients

  map.resources :overviews

    #map.resources :new_implementations
    #map.resources :admins
    map.resources :members
    
    #map.root :controller => "pages", :action => "index"
    #map.root :controller => "members", :action => "index"
    map.root :controller => "overviews", :action => "index"
    map.login '/admins', :controller => 'sessions', :action => 'new', :layout => 'login'
   
    map.signup '/signup', :controller => 'users', :action => 'new'
    map.login '/login', :controller => 'sessions', :action => 'new'
    map.logout '/logout', :controller => 'sessions', :action => 'destroy'
    map.activate '/activate/:id', :controller => 'accounts', :action => 'show'
    map.forgot_password '/forgot_password', :controller => 'passwords', :action => 'new'
    map.reset_password '/reset_password/:id', :controller => 'passwords', :action => 'edit'
    map.change_password '/change_password', :controller => 'accounts', :action => 'edit'
    
    # See how all your routes lay out with "rake routes"
    map.resources :pages 
       
    map.resources :users, :member => { :enable => :put } do |users|
    users.resource :account
    users.resources :roles
    end
  
    map.resources :members do |members|
    members.index 'members/index', :controller => 'members', :action => 'index'
    members.new 'members/new', :controller => 'members', :action => 'new'    
    end
    map.resources :lookups 
    map.resources :location
    map.resources :industry
    #map.resources :regions
    map.resources :religions
    map.resources :computer_skill_category
    map.resources :computer_skill
    map.resources :professional_qualification
     map.simple_captcha '/simple_captcha/:action', :controller => 'simple_captcha'
     map.resource :session
     map.resource :password
     
     # Install the default routes as the lowest priority.
     map.connect ':controller/:action/:id'
     map.connect ':controller/:action/:id.:format'
     
     map.resources :clients
     map.resources :providers
     
 end

