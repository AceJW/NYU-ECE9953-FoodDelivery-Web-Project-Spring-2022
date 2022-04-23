<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LoginCheck</title>
</head>
<body>
	<%
	
	try{
		Cookie [] cookies =request.getCookies();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		boolean cookieStatus = false;
		for(Cookie cookie: cookies){
			if(cookie.getName().equals(username)){// cookie special 
				%>
				<form method="post" action="showCookie.jsp">
					<input type="hidden" name="username" value=<%=username%> readonly>
					<%
						response.sendRedirect("showCookie.jsp?username="+username);
						//request.getRequestDispatcher("showCookie.jsp").forward(request,response);
					%>
				</form>
				<%
				cookieStatus=true;
			}
		}

		if(cookieStatus!=true){
			out.print("Not in Cookie,creating");
			Cookie cookie = new Cookie("nyufoodproject"+username,password);
			cookie.setMaxAge(60);
			response.addCookie(cookie);
		}	
	}catch (Exception ex) {
		out.print(ex);
	}

	%>
	<form method="get" action="../html/login2.html">
	<br>
		<input type="submit" value="Back to Login Page">
	<br />
	</form>
	
	<form method="get" action="getCookie.jsp"> 
	<br>
		<input type="submit" value="checkCookie.jsp">
	<br />
	</form>
	

</body>
</html>