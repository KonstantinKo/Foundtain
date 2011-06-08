// function switchtype(id)
// {
// 	var element = document.getElementById(id);
// 	
// 	// type == "password -> "text"
// 	if (element.getAttribute("type", 0) == "password") 
// 	{
// 		if (element.getAttribute("value", 0) == "")
// 		{
// 			element.setAttribute("type", "text");
// 			element.setAttribute("value", "...and your (desired) password.");
// 		}
// 	}
// 	
// 	// type == "text" -> "password"
// 	else 
// 	{
// 		if (element.getAttribute("value", 0) == "...and your (desired) password.")
// 		{
// 		element.setAttribute("type", "password");
// 		element.setAttribute("value", "");
// 	  }
// 	}
// }



function switchtype(id)
{
	var element = document.getElementById(id);
	
	// type == "password -> "text"
	if (element.getAttribute("type", 0) == "password") 
	{
		if (element.value == "")
		{
			element.setAttribute("type", "text");
			element.value = "...and your (desired) password.";
		}
	}
	
	// type == "text" -> "password"
	else 
	{
		if (element.value == "...and your (desired) password.")
		{
		element.setAttribute("type", "password");
		element.value = "";
	  }
	}
}

function switchvalue(id)
{
	var element = document.getElementById(id);

	if (element.value == "")
	{
		element.value = "Type in your email address...";
	}
	else if (element.value == "Type in your email address...")
	{
	element.value = "";
  }
}