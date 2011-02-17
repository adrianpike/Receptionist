Receptionist::Application.routes.draw do
  devise_for :users

	resources :identities

  resources :permissions

  resources :orgranizations

	resource :user

	resources :utilizations

  resources :resources do |r|
		member do
			get :utilize
			get :dashboard
		end
	end

	root :to => "utilizations#index"
end
