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
		eval(utilization_code) # TODO: sandbox this
	end
	
end
