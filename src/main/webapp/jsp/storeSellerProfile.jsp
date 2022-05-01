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
		String referer = request.getHeader("Referer");
		if(referer == null) {
			response.sendRedirect("../html/login2.html");
		} else if((referer.indexOf("EditSellerProfile.jsp")==-1)) {
			response.sendRedirect("../html/login2.html");
		} else {
			try {
				//Get the database connection
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();

				//Create a SQL statement
				Statement stmt = con.createStatement();
				String restaurantName = (String)request.getSession().getAttribute("restaurantName");
				if(restaurantName == null) restaurantName = "Ace Home";
				//Get parameters from the HTML form at the index.jsp
				String username = request.getParameter("username");
				String newRestaurantName = request.getParameter("restaurantName");
				String photoURL = request.getParameter("photoURL");
				String address = request.getParameter("address");
				String city = request.getParameter("city");
				String country = request.getParameter("country");
				String zipcode = request.getParameter("zipcode");
				//Make an insert statement for the Sells table:
				String update = "update restaurant set username = ?, restaurantName = ?, address = ?, city = ?, country = ?, zipcode = ?, imgUrl = ? where restaurantName = ?";
				

				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(update);

				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setString(1, username);
				ps.setString(2, newRestaurantName);
				ps.setString(3, address);
				ps.setString(4, city);
				ps.setString(5, country);
				ps.setString(6, zipcode);
				ps.setString(7, photoURL);
				ps.setString(8, restaurantName);	

				ps.executeUpdate();
				String update2 = "update Foods set restaurantName = ? where restaurantName = ?";
				PreparedStatement ps2 = con.prepareStatement(update2);
				ps2.setString(1, newRestaurantName);
				ps2.setString(2, restaurantName);
				ps2.executeUpdate();
				//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
				con.close();
				request.getSession().setAttribute("role", "seller");
				response.sendRedirect("../sellerDashboard.jsp?username="+(String)request.getSession().getAttribute("username"));
				//out.print("Username exist!");
			} catch (Exception ex) {
				out.print(ex.getMessage());
				/* response.sendRedirect("../html/login2.html"); */
				//out.print("Username exist!");
			}
		}
		
		
	%>
	
			<form method="get" action="../html/login2.html">
<!-- 			<br> -->
<!-- 				<input type="submit" value="Back to Login Page"> -->
<!-- 			<br /> -->
		</form>


</body>
</html>