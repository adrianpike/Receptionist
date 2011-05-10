class Organization < ActiveRecord::Base
	has_many :users

  data_fabric :replicated => true

	has_many :permissions, :as => :object
	has_many :resources, :through => :permissions	
end
