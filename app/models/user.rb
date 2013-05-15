class User < ActiveRecord::Base
	attr_accessor :password, :password_confirmation
  attr_accessible :email, :name, :date_of_birth

  validates :name, :date_of_birth, :password, :password_confirmation, :presence => true

  validates :email,
  			:format => { :with => /^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/,
  									 :message => "Email is not in proper format" },
    		:presence => true,
    		:uniqueness => { :case_sensitive => false }
end
