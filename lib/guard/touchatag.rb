require 'nfc'

module Guard

	class Touchatag < Base
		
		def initialize(resource)
			@resource = resource
		end
	
		def patrol
			while 1 do
				instance = NFC.instance
				Rails.logger.info("[GUARD] -- Patrolling.\n")
				tag = NFC.instance.find do |tag|
					authenticate({:key => tag, :type => 'Identity::Touchatag'})
					sleep 5
				end
			end
		end
	
	end

end