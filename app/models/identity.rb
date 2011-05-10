class Identity < ActiveRecord::Base
	belongs_to :user
  
	validates_presence_of :name
	
	data_fabric :replicated => true
	
	def utilized_resource!(resource)
		self.authorizations_count += 1
		self.save
		
		Juggernaut.publish('/resources/'+resource.id.to_s+'/log','utilized by ' + self.user.to_s)
	  
		Utilization.create({
			:resource => resource,
			:identity => self
		})
	end
	
	def rejected_resource!(resource = nil)
		self.rejections_count += 1
		self.save
		
		Utilization.create({
			:resource => resource,
			:identity => self,
			:approved => false
		}) if resource
	end
end
