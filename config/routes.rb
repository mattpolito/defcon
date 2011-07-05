Defcon::Application.routes.draw do
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout

  resources :issues do
    collection do
      post 'prioritize'
      post 'assignment'
    end
  end

  root :to => "issues#index"
end
