class IdentitiesController < ApplicationController
	
	def new
		@identity = Identity.new
	end
	
	def create
		@identity = Identity.new(params[:identity])
		@identity.user = current_user
		@identity.save
		
		redirect_to user_path
	end
			
end
