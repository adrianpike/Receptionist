class User < ActiveRecord::Base
	has_many :identities
	belongs_to :organization
	
	has_many :permissions, :as => :object
	has_many :resources, :through => :permissions

  has_attached_file :avatar, :styles => { :medium => "300x300>", :small => "100x100>" }
	
	# Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :oauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :phone, :avatar

	def to_s
		name? ? name : email
	end
end
