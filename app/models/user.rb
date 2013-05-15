# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  en_passwd  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessor :password
  attr_accessible :email, :name, :date_of_birth, :password_confirmation, :password

  email_regex = /^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/

  validates :name, :date_of_birth, :presence => true
  validates :password, :length => { :minimum => 6},
  										 :presence => true,
  										 :confirmation => true
  validates :email,
  			:format => { :with => email_regex,
  									 :message => "Email is not in proper format" },
    		:presence => true,
    		:uniqueness => { :case_sensitive => false }

  has_many :plans
  before_save :encrypt_password

  def has_password?(submitted_password)
  	enc_password == encrypt(submitted_password)
  end

  class << self
  	def authenticate(email, sub_password)
  		user = find_by_email(email)
  		return nil if user.nil?
  		return user if user.has_password?(sub_password)
  	end
  end

  private
  	def encrypt_password
  		self.salt = make_salt if new_record?
  		self.enc_password = encrypt(self.password)
  	end

  	def encrypt(str)
  		secure_hash("#{salt}--#{str}")
  	end

  	def secure_hash(str)
  		Digest::SHA2::hexdigest(str)
  	end

  	def make_salt
  		secure_hash("#{Time.now.utc}--#{password}")
  	end

end
