class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  attr_accessible :email, :name, :password, :password_confirmation
	validates :name, :presence => true
	validates :email, :presence => true, format: {with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
	before_save { |user| user.email = email.downcase }
	has_secure_password
end
