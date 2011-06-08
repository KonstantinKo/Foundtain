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
    user = User.find_by_email(params[:user][:email])
    if user.nil?
      ##redirect_to sign_up_path, :flash => {:failure => params }
      #Create new user
      @user = User.new(params[:user])
      if @user.save
        redirect_to edit_user_path(@user), 
        :flash => { :success => "The account was created successfully." }
      else
        redirect_to root_path, 
        :flash => {:failure => "You're doing it wrong. (Please try again.)"}
      end
      #/Create new user
    else
      ##redirect_to log_in_path, :flash => {:success => params }
      #Create session
      user = User.authenticate(params[:user][:email],
                               params[:user][:password])
      if user.nil?
        redirect_to root_path, :flash => { :failure => "Invalid password" }
      else
        sign_in user
        redirect_to index_users_path, :flash => { :success => "You logged in!" }
      end
      #/Create session
    end
  end

end
