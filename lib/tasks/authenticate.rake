task :auth, :auth_key, :auth_type, :resource, :needs => :environment do |t, args|
	args.with_defaults(:resource => nil, :auth_type => 'Identity::Touchatag', :auth_key => nil)
  
	r=Resource.find_by_name(args[:resource]) if args[:resource]
	r=Resource.first unless r
	
	Guard::Base.new(r).authenticate({:key => args[:auth_key], :type => args[:auth_type]})
	
end