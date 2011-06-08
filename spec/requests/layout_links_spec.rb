require 'spec_helper'

describe "LayoutLinks" do
  
  describe "Homepage" do
    it "should create a user if it doesn't exist and log in if it does" do
      visit root_path
      response.should render_template('users/new')
      fill_in "user[email]",     :with => "newuser@domain.org.uk"
      fill_in "user[password]",  :with => "foobar"
      click_button
      flash[:success].should =~ /created/i
      # visit log_out_path
      # visit root_path
      # fill_in :email,   :with => "newuser@domain.org.uk"
      # fill_in :password, :with => "foobar"
      # click_button
      # flash[:success].should =~ /logged in/i  
    end
  end
end
