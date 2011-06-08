class UsersController < ApplicationController
  
  def show
    
  end
  
  def new
    @title = "Get Started!"
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, 
      :flash => { :success => "The account was created." }
    else
      redirect_to root_path, 
      :flash => {:failure => "You're doing it wrong. (Please try again.)"}
    end
  end

end
