class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  attr_accessible :email, :name, :password, :password_confirmation
	validates :name, :presence => true,  uniqueness: { case_sensitive: false}
	validates :email, :presence => true, format: {with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
	before_save { |user| user.email = email.downcase; user.name = name.downcase }
	has_secure_password
	has_many :reservations, :dependent => :destroy
end
