<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="connection.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>

<meta charset="ISO-8859-1">
<title>LoginCheck</title>
</head>
<body>
<%
		try {
			 
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form
			String username = request.getParameter("username");
			String password = request.getParameter("password");
	
			//Make an insert statement for the login in blanks:
			String query = "SELECT * FROM users WHERE username = ? AND password = ?";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(query);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, username);
			ps.setString(2, password);
			//Run the query against the DB
			ResultSet rs = ps.executeQuery();
			
			boolean loggedIn = false;
			
			while(rs.next()) {
		loggedIn = !rs.wasNull();
			}
			
			if (loggedIn) {
				con.close();
				%>
				<form method="get" action="home.jsp">
					<input type="hidden" name="username" value = "<%=username%>" readonly>
				<%
					Cookie cookie = new Cookie("nyufoodproject"+username,password);
				    cookie.setMaxAge(60);
				    response.addCookie(cookie);
					response.sendRedirect("home.jsp?username="+username);
				%>
				</form>
				<%
			} else {
		out.print("Wrong username or password");
			}

			//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
			con.close();
			
		} catch (Exception ex) {
			out.print(ex);
		}
	%>

	
	</body>
</html>