module Guard

	class Base
		
		def initialize(resource)
			@resource = resource
		end
	
		def authenticate(*args)
			options = args.extract_options!

			Rails.logger.info("[GUARD] -- Authentication Request for '#{options[:key].to_s}'\n")
			if identity = Identity.find(:first, :conditions => {:data => options[:key].to_s.downcase, :type => options[:type]}) then
				@resource.reload
				if @resource.can_utilize?(identity) then
					Rails.logger.info("[GUARD] -- Utilization of #{@resource} approved.\n")
					identity.utilized_resource!(@resource)
					@resource.utilize!(identity)
				else
					Rails.logger.info("[GUARD] -- Utilization of #{@resource} *REJECTED* - No permissions.\n")
					identity.rejected_resource!(@resource)
				end
			else
				Rails.logger.info("[GUARD] -- Utilization of #{@resource} *REJECTED* - No identity found.\n")
			end
		end
	end

end