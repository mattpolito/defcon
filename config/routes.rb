Defcon::Application.routes.draw do
  resources :issues do
    collection do
      post 'prioritize'
      post 'assignment'
    end
  end

  root :to => "issues#index"
end
