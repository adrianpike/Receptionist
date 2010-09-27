class User < ActiveRecord::Base
	has_many :identities
	belongs_to :organization
	
	has_many :permissions, :as => :object
	has_many :resources, :through => :permissions
	
	# Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :oauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :oauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

	def to_s
		name? ? name : email
	end
end
