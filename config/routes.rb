Rails.application.routes.draw do
  get '/client_token' => 'donations#braintree_client_token'
  resources :pois, :only => [:index, :show]
end
