class UsersController < ApplicationController
  
  def index
    @title = "Users"
  end
  
  def show
    
  end
  
  def new
    @title = "Get Started!"
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to edit_user_path(@user), 
      :flash => { :success => "The account was created successfully." }
    else
      redirect_to root_path, 
      :flash => {:failure => "You're doing it wrong. (Please try again.)"}
    end
  end
  
  def edit
    # @user = User.find(params[:id])
  end

end
