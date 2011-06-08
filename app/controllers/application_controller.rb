class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include SessionsHelper
  
  
  # def decide
  #   if User.find(params[:id])
  #     redirect_to root_path, :flash => {:success => "Found user"}
  #   else
  #     redirect_to root_path, :flash => {:failure => "Didn't find user"}
  #   end
  # end
end
