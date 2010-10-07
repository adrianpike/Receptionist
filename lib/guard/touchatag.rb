require 'nfc'

module Guard

	class Touchatag
		
		def initialize(resource)
			@resource = resource
		end
	
		def patrol
			while 1 do
				instance = NFC.instance
				Rails.logger.info("[GUARD] -- Patrolling.\n")
				tag = NFC.instance.find do |tag|
					Rails.logger.info("[GUARD] -- Authentication Request for '#{tag.to_s}'\n")
					if identity = Identity::Touchatag.find_by_data(tag.to_s.downcase) then
						if @resource then
							@resource.reload
							if @resource.can_utilize?(identity) then
								Rails.logger.info("[GUARD] -- Utilization of #{@resource} approved.\n")
								identity.utilized_resource!(@resource)
								@resource.utilize!(identity)
							else
								Rails.logger.info("[GUARD] -- Utilization of #{@resource} *REJECTED*.\n")
								identity.rejected_resource!(@resource)
							end
						end
					else
						Rails.logger.info("[GUARD] -- Unknown Identity.\n")
					end
					sleep 5
				end
			end
		end
	
	end

end