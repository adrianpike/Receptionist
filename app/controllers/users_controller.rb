class UsersController < ApplicationController
	
	def show
		if params[:id] then
			@user = User.find(params[:id])
		else
			@user = current_user
		end
	end
	
	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update_attributes(params[:user]) then
			flash[:notice] = 'Successfully updated your details.'
			redirect_to user_path
		else
			flash[:error] = 'We were unable to update your details.'
			render :edit
		end
	end
	
end
