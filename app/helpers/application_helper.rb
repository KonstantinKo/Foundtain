module ApplicationHelper
  
  def title
    basetitle = "Foundtain"
    if @title.nil?
      basetitle
    else
      @title + " | " + basetitle
    end
  end
  
  # def decide
  #   if User.find(params[:id])
  #     route_to create_user_path
  #   else
  #     route_to create_session_path
  #   end
  # end
end
