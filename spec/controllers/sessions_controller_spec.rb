require 'spec_helper'

describe SessionsController do
  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
  
  describe "POST create" do
    describe "failure" do
      before(:each) do
        @attr = {:email => "", :passowrd => ""}
        post :create, :session => @attr
      end
      
      it "should re-render the login (/signup) page" do
        response.should redirect_to(log_in_path)
      end
      
      it "should flash an error message" do
        flash[:failure].should =~ /invalid password/i
      end
    end
    
    describe "success" do
      before(:each) do
        @user = Factory(:user)
        @attr = {:email => @user.email, :password => @user.password}
        post :create, :session => @attr
      end
      
      it "should redirect to the user index page" do
        response.should redirect_to(index_users_path)
      end
      
      it "should have a success flash" do
        flash[:success].should =~ /logged in/i
      end
      
      it "should sign the user in" do
        controller.current_user.should == @user
        controller.should be_signed_in
      end      
    end
  end
  
  describe "DELETE destroy" do
    before(:each) do
      test_sign_in(Factory(:user))
      delete :destroy
    end
    
    it "should sign a user out" do
      controller.should_not be_signed_in
    end
    
    it "should have a flash message" do
      response.should redirect_to(root_path)
      flash[:notice].should =~ /logged out/i
    end
  end

end
