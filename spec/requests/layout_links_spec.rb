require 'spec_helper'

describe "LayoutLinks" do
  
  describe "Homepage" do
    it "should create a user if it doesn't exist and log in if it does" do
      visit root_path
      response.should render_template('users/new')
      # Create user
      fill_in "user[email]",     :with => "newuser@domain.org.uk"
      fill_in "user[password]",  :with => "foobar"
      click_button
      assert_contain "created"
      visit log_out_path
      # Log in user
      visit root_path
      fill_in "user[email]",     :with => "newuser@domain.org.uk"
      fill_in "user[password]",  :with => "foobar"
      click_button
      assert_contain "logged in"
      visit log_out_path
      # Right email, wrong Password
      visit root_path
      fill_in "user[email]",     :with => "newuser@domain.org.uk"
      fill_in "user[password]",  :with => "youredoingitwrong"
      click_button
      assert_contain "password"
      visit log_out_path
      # Empty Request
      visit root_path
      fill_in "user[email]",     :with => ""
      fill_in "user[password]",  :with => ""
      click_button
      assert_contain "failed"
    end
  end
end
