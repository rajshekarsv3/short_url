class User < ActiveRecord::Base
	has_many :urls

	#validations
	validates_presence_of :name,:email,:encrypted_password
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates_uniqueness_of :email


	#Authenticate methods
	def self.encrypt_password(password)
		password ? BCrypt::Password.create(password).to_s : ''
	end
	def authenticate(password)
		BCrypt::Password.new(self.encrypted_password) == password 
	end
	def self.get_api_token
		begin
      token = SecureRandom.base64(24)
    end while (User.exists?(:api_token => token) )
    token
	end
end
