module ApplicationHelper
  
  def title
    basetitle = "Foundtain"
    if @title.nil?
      basetitle
    else
      @title + " | " + basetitle
    end
  end
  

end
