class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      redirect_to log_in_path, :flash => { :failure => "Invalid password" }
    else
      sign_in user
      redirect_to index_users_path, :flash => { :success => "Logged in!" }
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path, :flash => { :notice => "Logged out." }
  end

end
