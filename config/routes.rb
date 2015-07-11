Rails.application.routes.draw do
  get '/client_token' => 'donations#braintree_client_token'
  resources :pois, :only => [:index, :show] do
    member do
      post 'donations' => 'donations#create'
      get 'donations' => 'donations#index'
    end
  end

  match '*path', :to => 'cors#options', :via => [:options]
end
