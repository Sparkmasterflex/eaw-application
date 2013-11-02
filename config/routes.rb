Empires::Application.routes.draw do
  devise_for :users do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end
  
  resources :games do
    resources :empires, :only => :index
  end
  
  resources :empires do
    resources :pieces
  end
  
  resources :pieces
  resources :stages
  
  resources :website, only: :index do
    collection do
      get :view_empires
      get :stats
      get :instructions
    end
  end

  match '/view_empires' => 'website#view_empires', :as => :view_empires
  match '/stats' => 'website#stats'
  match '/instructions' => 'website#instructions'
  
  authenticated :user do
    root :to => "games#show"
  end
  root :to => "website#index"
end
