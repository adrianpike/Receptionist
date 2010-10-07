#!/usr/bin/env ruby

# You might want to change this
ENV["RAILS_ENV"] ||= "development"

require File.dirname(__FILE__) + "/../../config/application"
Rails.application.require_environment!

$running = true
Signal.trap("TERM") do 
  $running = false
end

while($running) do
  
  threads = []

	Resource.need_guarding.each {|r|
		p "Guarding #{r.name}"
		t = Thread.new do
			Guard::Touchatag.new(r).patrol # FIXME
		end
		threads << t
	}
	
	threads.each {|t|
		t.join
	}
  
end