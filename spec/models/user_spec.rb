require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :email => "user@example.com", :password => "foobar" }
  end
  it "should create a user given valid attributes" do
    User.create!(@attr)
  end
  
  describe "emails" do
    it "should require the existance of an email attribute" do
      User.create(@attr.merge(:email => nil)).
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
  
  describe "passwords" do
    before(:each) do
      @user = User.new(@attr)
    end
    
    it "should have a password attribute" do
      @user.should respond_to(:password)
    end
  end
  
  describe "password validations" do
    it "should require the existance of a password" do
      User.create(@attr.merge(:password => nil)).
        should_not be_valid
    end
    
    it "should accept valid passwords" do
      valid_passwords = ["hello", "FoObar~", "10923092oajdojcxkyjdjka"]
      valid_passwords.each do |pw|
        valid_user = User.create(@attr.merge(:email => Factory.next(:email), 
                                             :password => pw))
        valid_user.should be_valid
      end
    end

    it "should reject invalid passwords" do
     invalid_user = User.create(@attr.
                    merge(:password => "... and your (desired) password!"))
     invalid_user.should_not be_valid
    end
  end
  
  describe "password encryption" do
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should have an encrypted password attribute" do
      @user.should respond_to(:encrypted_password)
    end
    
    it "should set the encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end
    
    it "should have salt" do
      @user.should respond_to(:salt)
    end
    
    describe "has_password? method" do
      it "should exist" do
        @user.should respond_to(:has_password?)
      end
      
      it "should respond true if passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end
      
      it "should return false if passwords don't match" do
        @user.has_password?('doesntmatch').should be_false
      end
    end
    
    describe "authenticate method" do
      it "should exist" do
        User.should respond_to(:authenticate)
      end
      
      it "should return nil on email/password mismatch" do
        User.authenticate(@attr[:email], 'mismatch').should be_nil
      end
      
      it "should return nil for an email address without a user" do
        User.authenticate('noexist@com.com', @attr[:password]).should be_nil
      end
      
      it "should return the user on email/password match" do
        User.authenticate(@attr[:email], @attr[:password]).should == @user
      end
    end
  end
end
