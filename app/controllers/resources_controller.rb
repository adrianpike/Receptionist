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
	
	def dashboard
	  @resource = Resource.find(params[:id])
  end
	
	def update
		@resource = Resource.find(params[:id])
		@resource.update_attributes(params[:resource])
		redirect_to resource_path(@resource)
	end
	
	def utilize
		if params[:key] then
			@identity = Identity.find(:first, :conditions => ['type = ? and LOWER(data) = ?', params[:type], params[:key].to_s.downcase])
		elsif current_user then
			@identity = current_user.identities.first
		end
		if @identity then
			@resource = Resource.find(params[:id])
			if @resource and @resource.can_utilize?(@identity) then
				@identity.utilized_resource!(@resource)
				@resource.utilize!
				render :text => 'Utilization approved.'
			else
				render :text => 'Unauthorized.'
			end
		else
			render :text => 'No Identity.'
		end
	end
	
end
