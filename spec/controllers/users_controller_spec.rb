require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
    end
    
    it "should be successful" do
      get :show, :id => @user.id
      response.should be_success
    end
    
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
    
    it "should have the right title" do
      get :new
      response.should have_selector('title',
                                    :content => "Get Started! | Foundtain")
    end
    
    describe "form" do
      it "should have a password field" do
        get :new
        response.should have_selector('input', :name => "user[password]")
      end
    end
    
  end
  
  describe "POST 'create'" do
    describe "success" do
      before(:each) do
        @attr = {:email => "example@here.com", :password => "foobar"}
      end
      
      it "should create a new user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end
      
      it "should have a success flash" do
        post :create, :user => @attr
        flash[:success].should =~ /created/i
      end
      
      it "should redirect to the member show page" do
        post :create, :user => @attr
        response.should redirect_to(edit_user_path(assigns(:user)))
      end
    end
    
    describe "failure" do
      before(:each) do
        @attr = {:email => "", :password => ""}
      end
      
      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end
      
      it "should redirect to the root path with a failure flash" do
        post :create, :user => @attr
        response.should redirect_to(root_path)
        flash[:failure].should =~ /try again/i
      end
    end
    
    describe "success" do
      before(:each) do
        @attr = {:email => "sample@sampleuser.com", :password => "foobar"}
      end
      
      it "should create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end
      
      it "should redirect to the edit user page with a success flash" do
        post :create, :user => @attr
        response.should redirect_to(edit_user_path(assigns(:user)))
        flash[:success].should =~ /successful/i
      end
    end
  end
  
  describe "GET edit" do
    before(:each) do
      @user = Factory(:user)
    end
    it "should exist" do
      get :edit, :id => @user
      response.should be_success
    end
  end

end
