Rails.application.routes.draw do
  resources :pois, :only => [:index, :show]
end
