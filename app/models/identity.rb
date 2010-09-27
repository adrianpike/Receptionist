class Identity < ActiveRecord::Base
	belongs_to :user
	
	validates_presence_of :name, :data
	
	def utilized_resource!(resource)
		self.authorizations_count += 1
		self.save
		
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
