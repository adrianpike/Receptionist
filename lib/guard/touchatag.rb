require 'nfc'

module Guard

	class Touchatag
		
		def initialize(resource)
			@resource = resource
		end
	
		def patrol
			while 1 do
				instance = NFC.instance
				printf "[GUARD] -- Patrolling.\n"
				tag = NFC.instance.find
				unless tag.to_s.blank? then
					printf "[GUARD] -- Authentication Request for '#{tag.to_s}'\n"
					if identity = Identity::Touchatag.find_by_data(tag.to_s.downcase) then
						if @resource then
							@resource.reload
							if @resource.can_utilize?(identity) then
								printf "[GUARD] -- Utilization of #{@resource} approved.\n"
								identity.utilized_resource!(@resource)
								@resource.utilize!(identity)
							else
								printf "[GUARD] -- Utilization of #{@resource} *REJECTED*.\n"
								identity.rejected_resource!(@resource)
							end
						end
					else
						printf "[GUARD] -- Unknown Identity.\n"
					end
				end
				sleep 1
			end
		end
	
	end

end