<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="connection.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>createAccount</title>
</head>
<body>
	<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			//Create a SQL statement
			Statement stmt = con.createStatement();

			//Get parameters from the HTML form at the index.jsp
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String password2 = request.getParameter("password2");
			if(password.equals(password2)) {
	
				//Make an insert statement for the Sells table:
				String insert = "INSERT INTO users(username, password, role)"
				+ "VALUES (?, ?, ?)";
				
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(insert);
	
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, username);
				ps.setString(2, password);
				ps.setString(3, "user");
	
	
				ps.executeUpdate();
				
				//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
				con.close();
				out.print(username + " Account created!");
				%>
				<script type="text/javascript"> alert("Account Created Successfully!"); 
				window.location = "../html/login2.html"; 
				</script>						
				<%
			} else {
				%>
				<script type="text/javascript"> alert("Password Must be Same!"); 
				window.location = "../html/login2.html"; 
				</script>
				
				<%
			}
			
			//response.sendRedirect("../html/login2.html");
		} catch (Exception ex) {
			%>
			
			<script type="text/javascript">
			 alert("Username exist!");
			 window.location = "../html/login2.html";
			 </script>
			
			<%
			//out.print("Username exist!");
		}
		
	%>
	
			<form method="get" action="../html/login2.html">
<!-- 			<br> -->
<!-- 				<input type="submit" value="Back to Login Page"> -->
<!-- 			<br /> -->
		</form>


</body>
</html>