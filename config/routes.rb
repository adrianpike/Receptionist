Receptionist::Application.routes.draw do
  devise_for :users

	resources :identities

  resources :permissions

  resources :orgranizations

	resource :user

  resources :resources

	root :to => "receptionist#index"
end
