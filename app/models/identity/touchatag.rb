class Identity::Touchatag < Identity
	
	validates_format_of :data, :with => /^[0-9a-f]{14}$/i
	
end