Defcon::Application.routes.draw do
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signout' => 'sessions#destroy', :as => :signout

  resources :issues do
    post 'prioritize', :on => :collection
    post 'assignment', :on => :collection
  end

  root :to => "issues#index"
end
