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
      :flash => { :success => "The creation was successful." }
    else
      redirect_to root_path, 
      :flash => {:failure => "Creation was unsuccessful. Please try again."}
    end
  end

end
