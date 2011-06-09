class PagesController < ApplicationController
  def home
  end

  def about
  end

  def terms
  end

  def privacy_policy
  end
  
  def decide
      if User.find_by_email(params[:user][:email])
        #Create session
        user = User.authenticate(params[:user][:email],
                                 params[:user][:password])
        if user.nil?
          redirect_to root_path, 
                      :flash => { :failure => "Sorry, wrong password" }
        else
          sign_in user
          redirect_to index_users_path, 
                      :flash => { :success => "You logged in!" }
        end
        #/Create session
      else
        #Create new user
        @user = User.new(params[:user])
        if @user.save
          redirect_to edit_user_path(@user), 
                      :flash => { :success => "The account was created 
                                               successfully." }
        else
          redirect_to root_path, 
                      :flash => {:failure => "Account creation failed. Don't 
                                              use spaces in your password."}
        end
        #/Create new user
      end
    end
  
  # def decide
  #   if User.find_by_email(params[:user][:email])
  #     redirect_to params.merge! :controller => :sessions, :action => :create
  #     page.alert params
  #   else
  #     redirect_to params.merge! :controller => :users, :action => :create
  #     page.alert params
  #   end    
  # end

end
