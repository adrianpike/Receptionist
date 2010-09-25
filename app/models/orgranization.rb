class Orgranization < ActiveRecord::Base
	has_many :users
	
	has_many :permissions, :as => :object
	has_many :resources, :through => :permissions	
end
