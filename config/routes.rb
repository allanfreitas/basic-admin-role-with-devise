Webcore::Application.routes.draw do
  
  devise_for :user, :skip => [:sessions, :registrations] do
    get 'login' => 'sessions#new', :as => :new_user_session
    post 'login' => 'devise/sessions#create', :as => :user_session
    get 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session
    
    get 'change_password' => 'devise/registrations#edit', :as => :edit_user_registration
    post 'change_password' => 'devise/registrations#create', :as => :user_registration
    put 'change_password' => 'devise/registrations#update'
  end
  
  get 'admin' => 'admin#index', :as => :admin_index
  
  namespace :admin do
    resources :users
  end

  root :to => "home#index"

end
