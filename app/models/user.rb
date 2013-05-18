# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  email                  :string(255)
#  en_passwd              :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  salt                   :string(255)
#  date_of_birth          :date
#  is_admin               :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessor :password
  attr_accessible :email, :name, :date_of_birth, :password_confirmation, :password, :remember_me, :is_admin

  email_regex = /^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/

  validates :name, :presence => true
  validates :password, :length => { :minimum => 6},
  										 :presence => true,
  										 :confirmation => true
  validates :email,
  			:format => { :with => email_regex,
  									 :message => "Email is not in proper format" },
    		:presence => true,
    		:uniqueness => { :case_sensitive => false }

  has_many :plans
  # has_many :invitations, :foreign_key => :to_id
  before_save :encrypt_password

  def has_password?(submitted_password)
  	self.en_passwd == encrypt(submitted_password)
  end

  class << self
  	def authenticate(email, sub_password)
  		user = find_by_email(email)
      (user && user.has_password?(sub_password)) ? user : nil
  	end

    def authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
    end
  end

  private
  	def encrypt_password
  		self.salt = make_salt(self.password) if new_record?
  		self.en_passwd = encrypt(self.password)
  	end

  	def encrypt(str)
  		secure_hash("#{salt}--#{str}")
  	end

  	def secure_hash(str)
  		Digest::SHA2::hexdigest(str)
  	end

  	def make_salt(password)
  		secure_hash("#{Time.now.utc}--#{password}")
  	end

end
