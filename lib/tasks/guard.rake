task :guard do
	Guard::Touchatag.new(Resource.first).patrol	
end