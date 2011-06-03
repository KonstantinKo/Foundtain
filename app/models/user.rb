class User < ActiveRecord::Base
  # attr_accessor   :password
  # attr_accessible :email, :password
  
  validates       :email,    :presence => true
  validates       :password, :presence => true
end
