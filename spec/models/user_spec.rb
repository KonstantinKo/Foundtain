require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :email => "user@example.com", :password => "foobar" }
  end
  it "should create a user given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require the existance of an email attribute" do
    User.create(@attr.merge(:email => nil)).
      should_not be_valid
  end
  
  it "should require the existance of a password" do
    User.create(@attr.merge(:password => nil)).
      should_not be_valid
  end
  
  it "should require the email to be unique up to case" do
    upcased_user = User.create(@attr.merge(:email => "UsEr@eXaMpLe.CoM"))
    dup_user = User.create(@attr)
    dup_user.should_not be_valid
  end
  
  it "should reject invalid email adresses" do
    invalid_emails = ["user.com", "example@dotcom", "user@.com"]
    invalid_emails.each do |email|
      invalid_user = User.create(@attr.merge(:email => email))
      invalid_user.should_not be_valid
    end
  end
  
  it "should accept valid emails" do
    valid_emails = ["user@go.co.uk", "BaGaLoo@FOO.bar", "foo+bar@baz.qoo"]
    valid_emails.each do |email|
      valid_user = User.create(@attr.merge(:email => email))
      valid_user.should be_valid
    end
  end
end
