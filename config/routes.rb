Defcon::Application.routes.draw do
  get 'login' => 'sessions#new', :as => :login 
  get 'logout' => 'sessions#destroy', :as => :logout 
  resources :users
  resources :sessions
  resources :issues do
    collection do
      post 'prioritize'
      post 'assignment'
    end
  end

  root :to => "issues#index"
end
