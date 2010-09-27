class Permission < ActiveRecord::Base
	belongs_to :resource
	belongs_to :object, :polymorphic => true
	
	def to_s
		"#{object_type}##{object_id} - #{resource.name rescue ''}"
	end
	
	def identity_id; object_id if object.is_a?(Identity);	end
	def user_id; object_id if object.is_a?(User);	end
	def organization_id; object_id if object.is_a?(Organization);	end
	
	def identity_id=(i)
		unless i.blank? then
			self.object_id = i
			self.object_type = 'Identity'
		end
	end

	def user_id=(i)
		unless i.blank? then
			self.object_id = i
			self.object_type = 'User'
		end
	end

	def organization_id=(i)
		unless i.blank? then
			self.object_id = i
			self.object_type = 'Organization'
		end
	end
	
end
