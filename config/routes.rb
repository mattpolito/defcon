Defcon::Application.routes.draw do
  constraints(Subdomain) do
    devise_for :users do
      get "sign_in", :to => "devise/sessions#new"
      get "sign_out", :to => "devise/sessions#destroy"
    end

    resources :issues do
      collection do
        post 'prioritize'
        post 'assignment'
      end
    end

    root :to => "issues#index"
  end
end
