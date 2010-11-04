class UtilizationsController < ApplicationController
	
	def index
		@utilizations = Utilization.all(:limit=>10, :order =>'created_at desc')
		
		respond_to do |format|
			format.js {
				render :partial => 'utilization', :collection => @utilizations
			}
			format.html {
			}
			format.json {
				render :text => @utilizations.to_json(
				:only => [:created_at],
				:include => {:resource => {
					:only => [:name]
				} ,:identity => {
					:include => {:user => {
						:only => [:name,:email,:avatar_file_name,:avatar_content_type]
					}}, :only => [:authorizations_count]
				}})
			}
		end
	end
	
end