class ResourcesController < ApplicationController
	
	def index
		@resources = Resource.all
	end
	
	def new
		@resource = Resource.new
	end
	
	def create
		@resource = Resource.create(params[:resource])
		redirect_to resources_path
	end
	
	def show
		@resource = Resource.find(params[:id])
	end
	
	def update
		@resource = Resource.find(params[:id])
		@resource.update_attributes(params[:resource])
		redirect_to resource_path(@resource)
	end
	
	def utilize
		@resource.utilize!(current_user)
		
		redirect_to resource_path(@resource)
	end
	
end
