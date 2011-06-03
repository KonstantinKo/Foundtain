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
  
end
