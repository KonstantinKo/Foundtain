# == Schema Information
# Schema version: 20110608123645
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  salt               :string(255)
#  encrypted_password :string(255)
#

class User < ActiveRecord::Base
  attr_accessor   :password
  # attr_accessible :email, :password
  
  before_save :encrypt_password
  
  email_regex     = /\S+@\S+\.\S+/i   # x@y.z
  password_regex  = /^\S+$/i          # Disallows spaces
  
  validates       :email,    :presence => true, 
                             :uniqueness => { :case_sensitive => false },
                             :format => { :with => email_regex }
  validates       :password, :presence => true,
                             :format => { :with => password_regex }
                             
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  class << self
    def authenticate(email, submitted_password)
      user = find_by_email(email)
      ( user && user.has_password?(submitted_password) ) ? user : nil
    end	
    
    def authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
    end
  end
  
  private
  
  def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(self.password)
  end
  
  def encrypt(string)
    secure_hash("#{salt}-foundtain-#{string}")
  end
  
  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
