class User < ActiveRecord::Base
  # attr_accessor   :password
  # attr_accessible :email, :password
  
  email_regex = /\S+@\S+\.\S+/i
  
  validates       :email,    :presence => true, 
                             :uniqueness => { :case_sensitive => false },
                             :format => { :with => email_regex }
  validates       :password, :presence => true
end
