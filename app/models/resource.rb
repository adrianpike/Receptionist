class Resource < ActiveRecord::Base
	
	has_many :permissions
	
	has_many :identities, :through => :permissions
	has_many :organizations, :through => :permissions
	has_many :users, :through => :permissions
	
	named_scope :need_guarding, :conditions => {'is_guarded' => true}
		
	def can_utilize?(identity)
		u = identity.user
		# need to check if a user is in an organization that has permission
		# need to check if that identity is directly permissioned
		# need to check if that user has permissions
	end
	
	def utilize!(identity = nil)
	   # TODO: sandbox this
	   self.currently_utilizing=true
	   self.save
	   
		eval(utilization_code)
		Juggernaut.publish('/resources/'+self.id.to_s+'/status','utilizing')
		
		if (completion_code?) then
  		sleep utilization_length # FIXME
  		eval(completion_code)
  	end
  	
  	Juggernaut.publish('/resources/'+self.id.to_s+'/status','not-utilizing')
  	
  	 self.currently_utilizing=false
	   self.save
	end
	
end
