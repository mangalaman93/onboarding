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
  attr_accessor :password, :password_confirmation
  
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :en_passwd, :name
  attr_accessible :email, :name, :date_of_birth

  validates :name, :date_of_birth, :password, :password_confirmation, :presence => true

  validates :email,
  			:format => { :with => /^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/,
  									 :message => "Email is not in proper format" },
    		:presence => true,
    		:uniqueness => { :case_sensitive => false }

  has_many :plans
end
