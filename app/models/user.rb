class User
	include Mongoid::Document
	include Mongoid::Slug

	devise :omniauthable, :omniauth_providers => [:github]
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :trackable, :validatable

	## Database authenticatable
	field :email,              :type => String, :default => ""
	field :encrypted_password, :type => String, :default => ""

	## Recoverable
	field :reset_password_token,   :type => String
	field :reset_password_sent_at, :type => Time

	## Rememberable
	field :remember_created_at, :type => Time

	## Trackable
	field :sign_in_count,      :type => Integer, :default => 0
	field :current_sign_in_at, :type => Time
	field :last_sign_in_at,    :type => Time
	field :current_sign_in_ip, :type => String
	field :last_sign_in_ip,    :type => String

	## Confirmable
	# field :confirmation_token,   :type => String
	# field :confirmed_at,         :type => Time
	# field :confirmation_sent_at, :type => Time
	# field :unconfirmed_email,    :type => String # Only if using reconfirmable

	## Lockable
	# field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
	# field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
	# field :locked_at,       :type => Time
	field :FirstName, :type => String
	field :LastName, :type => String

	# needed for oauth
	field :provider, :type => String
	field :uid, :type => String
	field :name, :type => String
	field :username, :type => String

	slug :username

	has_many :styleguides

	def self.find_for_github_oauth(auth, signed_in_resource=nil)
		
		user = User.where(:provider => auth.provider, :uid => auth.uid).first
		unless user
			user = User.create(name:auth.extra.raw_info.name,
			                     provider:auth.provider,
			                     uid:auth.uid,
			                     email:auth.info.email,
			                     password:Devise.friendly_token[0,20]
			                     )
		
		end

		user
	end

	def self.new_with_session(params, session)
	    super.tap do |user|
	      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
	        user.email = data["email"] if user.email.blank?
	      end
	    end
	end

end
