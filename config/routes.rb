CreatingCode::Application.routes.draw do

  devise_for :users,:path => 'admin', :controllers => { :sessions => "sessions" }

  # The priority is based upon order of creation:
  # first created -> highest priority.

  scope "(:locale)/", :locale => /zh_TW|en/ do  
	  
	  root :to => "static_pages#index"

	  namespace :admin do
	  		
			match '/'		=> 'posts#index'

      resources :users
      resources :posts

		end

	  resources :posts
	  
	  match 'qa'			=> 'posts#index', :as => :qa
	  
	  match ':pagename'		=> 'static_pages#show'
  end

end