class Suggestion < ActiveRecord::Base
  attr_accessible :email, :name, :suggestion_data, :captcha, :captcha_key

  apply_simple_captcha :message => "The secret Image and code were different", :add_to_base => true

  email_regex = /^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$/

  validates :name, :presence => true
  validates :suggestion_data, :presence => true, :length => { :maximum => 150}
  validates :email,
  			:format => { :with => email_regex,
  						 :message => "Email is not in proper format" },
    		:presence => true
end