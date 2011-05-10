class Resource < ActiveRecord::Base
	has_many :permissions
	
	has_many :identities, :through => :permissions
	has_many :organizations, :through => :permissions
	has_many :users, :through => :permissions
	
	named_scope :need_guarding, :conditions => {'is_guarded' => true}
		
	def can_utilize?(identity)
		u = identity.user
		# TODO: need to check if a user is in an organization that has permission
		# TODO: need to check if that identity is directly permissioned
		# TODO: need to check if that user has permissions
	end
	
	def utilize!
	  self.currently_utilizing=true
	  self.save
	   
	  Juggernaut.publish('/resources/'+self.id.to_s+'/status','utilizing')
		eval(utilization_code)
	end
	
	def finish_utilizing!
	  if (completion_code?) then
  		eval(completion_code)
  	end
  	
  	Juggernaut.publish('/resources/'+self.id.to_s+'/status','not-utilizing')
  	self.currently_utilizing = false
    self.save
  end

  def names
    translations = I18n.t('resources')
    (translations[self.id] || translations[:default])
  end
  
end
