class IdentitiesController < ApplicationController
	
	def new
		@identity = Identity.new
	end
	
	def edit
		@identity = Identity.find(params[:id])
	end
	
	def update
		@identity = Identity.find(params[:id])
		@identity.update_attributes(params[:identity])
	end
	
	def create
		@identity = Identity.new(params[:identity])
		@identity.user = current_user
		@identity.type = params[:identity][:type]
		@identity.save
		
		redirect_to user_path
	end
	
	def show
		@identity = Identity.find(params[:id])
	end
			
end
