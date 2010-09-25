require 'nfc'

module Guard

	class Touchatag
		
		def initialize(resource = nil)
			@resource = resource
		end
	
		def patrol
			last_uid = nil

			while 1 do
				NFC.instance.find do |tag|
					if last_uid != tag.uid then
						printf "[GUARD] -- Authentication Request for #{tag.uid}\n"
						# TODO: make this modular
						if account = AccountTouchatag.find_by_uid(tag.uid) then
							if @resource then
								# ensure that account can utilize the resource
							else
								# unlock the door
							end
						else
							# reject 'em
						end
					end
				end
			end
		end
	
	end

end