class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # def decide
  #   if User.find(params[:id])
  #     route_to create_user_path
  #   else
  #     route_to create_session_path
  #   end
  # end
end
