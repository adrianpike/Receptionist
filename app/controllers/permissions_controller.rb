class PermissionsController < ApplicationController
	
	def index
		@permissions = Permission.all
	end
	
	def new
		@permission = Permission.new
	end
	
	def create
		@permission = Permission.new(params[:permission])
		if @permission.save then
			redirect_to permissions_path
		else
			render :new
		end
	end
	
	def show
		@permission = Permission.find(params[:id])
	end
	
end
