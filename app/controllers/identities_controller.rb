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
	  # TODO: refactor
	  case params[:identity][:type]
	  when "Identity::QR"
	    @identity = Identity::QR.new(params[:identity])
	  else
		  @identity = Identity.new(params[:identity])
		end
		@identity.user = current_user
		# @identity.type = params[:identity][:type]
		@identity.save
		
		redirect_to user_path
	end
	
	def show
		@identity = Identity.find(params[:id])
	end
			
end
