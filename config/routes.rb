Rails.application.routes.draw do
  get '/client_token' => 'donations#braintree_client_token'
  resources :pois, :only => [:index, :show] do
    member do
      post 'donations' => 'donations#create'
      get 'donations' => 'donations#poi_index'
    end
  end

  resources :donations, :only => [:index]

  match '*path', :to => 'cors#options', :via => [:options]
  root :to => 'welcome#index'
end
