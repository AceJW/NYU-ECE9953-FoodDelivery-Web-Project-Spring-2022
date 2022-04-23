<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="connection.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LoginCheck</title>
</head>
<body>
	
	<%
	
	try{
		String referer = request.getHeader("Referer");
		out.print(referer);
		if((referer.indexOf("html/login.html"))!=-1){
			out.print("From 1st login");
			out.print("<br>");
			Cookie [] cookies =request.getCookies();
			for(Cookie cookie: cookies){
				out.print(cookie.getName()+" ");
				out.print("<br>");
				if((cookie.getName().indexOf("food"))!=-1){//find special format cookie 
					response.sendRedirect("showCookie.jsp?username="+cookie.getName());
				}else{
					response.sendRedirect("../jsp/login2.jsp");
				}
				
			}
		}
	}catch (Exception ex) {
		out.print(ex);
	}

	%>
</body>
</html>