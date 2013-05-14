class User < ActiveRecord::Base
  attr_accessible :email, :en_passwd, :name
end
