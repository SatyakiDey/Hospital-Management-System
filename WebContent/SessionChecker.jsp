<%@ page import="com.util.SessionChecker"%>
<%	
	if(!SessionChecker.isValidSession(session))
	{
		request.setAttribute("message","Invalid Session. Please login again");
		RequestDispatcher rd= request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}
  %>