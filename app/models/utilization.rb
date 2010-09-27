class Utilization < ActiveRecord::Base
	belongs_to :resource
	belongs_to :identity
end
