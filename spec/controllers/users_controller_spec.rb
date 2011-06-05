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
      response.should have_selector('title', :content => "Foundtain | Get Started!")
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
        flash[:success].should =~ /success/i
      end
      
      it "should redirect to the member show page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
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
  end

end
