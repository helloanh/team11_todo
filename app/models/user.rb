class User < ActiveRecord::Base
	has_one :account
	has_many :to_do_lists

	validates :password, presence: true, on: :create
	has_secure_password

end
