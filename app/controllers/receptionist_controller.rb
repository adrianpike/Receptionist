class ReceptionistController < ApplicationController
	def index
		@utilizations = Utilization.all(:limit=>10, :order =>'created_at desc')
	end
	
end
